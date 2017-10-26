<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\LiaoPl;

class Ltest extends Command
{

    protected $msg = 'test';

    public function __construct($msg)
    {
        $this->msg = $msg;
    }

    public function handle()
    {
    
        $aa=new LiaoPl();
        $aa->ltoken=1;
        $aa->token=1;
        $aa->time=time();
        $aa->desc=$this->msg;
        $aa->save();
        // echo 1;
        sleep(4);

        // echo $this->msg."\t".date("Y-m-d H:i:s")."\ntest";        
        // $this->delete();
    }
}
