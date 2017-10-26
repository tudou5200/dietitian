<?php
/**
	*@author leishangjie 2016-11-17
	*@version 2.0
	*@brief 项目上锁
**/
namespace App\Helpers;

class Lock
{
	public function up($file)
	{
		$time=time();

		//lock文件路径
		$sorce = fopen($file,"w+");  

		while(!flock($sorce, LOCK_EX)) 
		{
			if(time()-$time>50)
			{
				return '5';
			}
			else
			{
				sleep(rand(5));
			}
			
		}
		fclose($sorce); 
		return '1';
	}	
	public function down($file)
	{
		$time=time();

		//lock文件路径
		$sorce = fopen($file,"w+"); 
		while(!flock($sorce, LOCK_UN)) 
		{
			if(time()-$time>10)
			{
				return '1';
			}
			else
			{
				sleep(1);
			}
			
		}
		fclose($sorce);
		return '1';
	}	
}