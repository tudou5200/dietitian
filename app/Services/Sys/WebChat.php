<?php
namespace App\Services\Sys;
use App\Models\ChatLog;

class WebChat{
    public $address;
    public $port;
    public $master;  // 连接 server 的 client</span>
    public $sockets = array(); // 不同状态的 socket 管理</span>
    private $t=0;
    private $token;

    function __construct($address, $port)
    {
        set_time_limit(0);
        $this->address=$address;
        $this->port=$port;
        // 建立一个 socket 套接字
        $this->master = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)
        or die("socket_create() failed");
        socket_set_option($this->master, SOL_SOCKET, SO_REUSEADDR, 1)
        or die("socket_option() failed");
        socket_bind($this->master, $this->address, $this->port)
        or die("socket_bind() failed");
        socket_listen($this->master)
        or die("socket_listen() failed");
        $this->sockets[] = $this->master;
    }
    function start(){
        while(true) {
            $changed=$this->sockets;//让当前的socket列表加入到监听中</span>
            $write = NULL;
            $except = NULL;
            $num=socket_select($changed, $write, $except, 0);
            if($num==0){
                continue;
            }
            //$changed是引用变量，调用之后$changed是状态改变的数组，如果来新连接$changed里面会有$this->master</span>
            if(in_array($this->master,$changed)){
              


                //来新连接了</span>
                $socket_new = socket_accept($this->master);//返回值是一个resource</span>

                //socket_set_nonblock($socket_new);<span style="color:#ff0000;">//不能让master以外的socket为非阻塞的，因为会涉及到读socket数据</span>

               //通过socket获取数据执行handshake</span>
                @$header = socket_read($socket_new, 1024);
                $this->perform_handshaking($header, $socket_new, $this->address, $this->port);

                $this->sockets[$this->token]=$socket_new;
                var_dump($this->sockets);

             //从改变的socket数组里面删除</span>
                $found_socket = array_search($this->master, $changed);
                unset($changed[$found_socket]);
                //echo $msg." connect\n";
            }
            foreach ($changed as $changed_socket){

            //如果有client数据发送过来</span>
                $tag=false;

                while(socket_recv($changed_socket, $buf, 1024, 0) >= 1)//这里就要限制每次发送数据最多为1024，</span>
                {

                    //var_dump("wh");
                    $tag=true;

                    //解码发送过来的数据
                    $received_text = $this->unmask($buf);

                    $received_text = json_decode($received_text ,true);

                    if(empty($received_text))
                    {
                        break;
                    }

                    $cl=new ChatLog();

                    $cl->from=$received_text['data']['mine']['id'];
                    $cl->to=$received_text['data']['to']['id'];
                    $cl->service=$received_text['data']['to']['type'];
                    $cl->content=json_encode($received_text) ;
                    $cl->ctime=time();
                   
                    if(isset($this->sockets[$received_text['data']['to']['id']]))
                    {
                        $cl->type=2;
                        //编码需要发出的数据
                        $response_text = $this->mask(json_encode(array('type'=>'message', 'message'=>$received_text)));

                        $this->send_message([$this->sockets[$received_text['data']['to']['id']] ],$response_text);
                    }
                    else
                    {
                         $cl->type=1;
                    }

                    $cl->save();
                
                    break;
                    //跳出循坏，因为socket_recv()会阻塞，但是如果socket断开了之后，socket_recv()就不会阻塞了
                }

              //已经读了数据的跳过下面的断开连接判断，不然会阻塞</span>
                if($tag==true){
                    continue;
                }

               //检查offline的client，断开连接</span>

                @$buf = socket_read($changed_socket, 1024, PHP_NORMAL_READ);
                if ($buf === false) {
                //没有接受到数据的时候，但是这个socket又有变化，也就是断开连接</span>
                    $found_socket = array_search($changed_socket, $this->sockets);//返回下标</span>
                    socket_getpeername($changed_socket, $ip);
                    unset($this->sockets[$found_socket]);//必须要手动删除</span>
                }
            }
        }
    }

    function send_message($clients,$msg)
    {
        foreach($clients as $changed_socket)
        {
            socket_write($changed_socket,$msg,strlen($msg));
        }
        return true;
    }


    //解码数据
    function unmask($text) {
        $length = ord($text[1]) & 127;
        if($length == 126) {
            $masks = substr($text, 4, 4);
            $data = substr($text, 8);
        }
        elseif($length == 127) {
            $masks = substr($text, 10, 4);
            $data = substr($text, 14);
        }
        else {
            $masks = substr($text, 2, 4);
            $data = substr($text, 6);
        }
        $text = "";
        for ($i = 0; $i < strlen($data); ++$i) {
            $text .= $data[$i] ^ $masks[$i%4];
        }
        return $text;
    }

    //编码数据
    function mask($text)
    {
        $b1 = 0x80 | (0x1 & 0x0f);
        $length = strlen($text);

        if($length <= 125)
            $header = pack('CC', $b1, $length);
        elseif($length > 125 && $length < 65536)
            $header = pack('CCn', $b1, 126, $length);
        elseif($length >= 65536)
            $header = pack('CCNN', $b1, 127, $length);
        return $header.$text;
    }

    //握手的逻辑
    function perform_handshaking($receved_header,$client_conn, $host, $port)
    {
        $headers = array();
        $lines = preg_split("/\r\n/", $receved_header);
        foreach($lines as $line)
        {
            $line = chop($line);
            if(preg_match('/\A(\S+): (.*)\z/', $line, $matches))
            {
                $headers[$matches[1]] = $matches[2];
            }
        }

        if(preg_match('/GET.*token=([0-9a-zA-Z]+)\s+HTTP.*/', $lines[0], $matches))
        {
          $this->token=$matches[1]?$matches[1]:0;
        }

        $secKey = $headers['Sec-WebSocket-Key'];
        $secAccept = base64_encode(pack('H*', sha1($secKey . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11')));
        $upgrade  = "HTTP/1.1 101 Web Socket Protocol Handshake\r\n" .
            "Upgrade: websocket\r\n" .
            "Connection: Upgrade\r\n" .
            "WebSocket-Origin: $host\r\n" .
            "WebSocket-Location: ws://$host:$port/demo/shout.php\r\n".
            "Sec-WebSocket-Accept:$secAccept\r\n\r\n";
        socket_write($client_conn,$upgrade,strlen($upgrade));
    }
}
