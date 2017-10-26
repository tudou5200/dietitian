<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class Chat extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:chat';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'websocket listen';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $ws=new \App\Services\Sys\WebChat('59.110.29.200','8888');
        $ws->start();
    }
}
