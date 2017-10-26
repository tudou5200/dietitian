<?php

namespace App\Providers;

use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * This namespace is applied to your controller routes.
     *
     * In addition, it is set as the URL generator's root namespace.
     *
     * @var string
     */
    protected $namespace = 'App\Http';
    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        //

        parent::boot();
    }

    /**
     * Define the routes for the application.
     *
     * @return void
     */
    public function map()
    {
        $this->mapWebRoutes();
        $this->mapWebRoutes2();
         $this->mapWebRoutes3();
         $this->mapWebRoutes4();
    }

    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     *
     * @return void
     */
    // protected function mapWebRoutes()
    // {
    //     Route::group(['namespace' => $this->namespace,'middleware' => 'web'], function ($router) {

    //         foreach ($this->dir as $rout) 
    //         {
    //             foreach (glob(app_path('Routes//'.$rout) . '/*.php') as $file) {
    //                 $this->app->make('App\\Routes\\'.$rout.'\\' . basename($file, '.php'))->map($router);
    //             }
    //         }
    //     });
    // }
    protected function mapWebRoutes()
    {
        Route::group(['namespace' => $this->namespace,'middleware' => 'web'], function ($router) {


            foreach (glob(app_path('Routes//Sys') . '/*.php') as $file) {
                $this->app->make('App\\Routes\\Sys\\' . basename($file, '.php'))->map($router);
            }
        });
    }
    protected function mapWebRoutes2()
    {
        Route::group(['namespace' => $this->namespace,'middleware' => 'web'], function ($router) {


            foreach (glob(app_path('Routes//Back') . '/*.php') as $file) {
                $this->app->make('App\\Routes\\Back\\' . basename($file, '.php'))->map($router);
            }
        });
    }
    protected function mapWebRoutes3()
    {
        Route::group(['namespace' => $this->namespace,'middleware' => 'web'], function ($router) {


            foreach (glob(app_path('Routes//Front') . '/*.php') as $file) {
                $this->app->make('App\\Routes\\Front\\' . basename($file, '.php'))->map($router);
            }
        });
    }protected function mapWebRoutes4()
    {
        Route::group(['namespace' => $this->namespace,'middleware' => 'web'], function ($router) {


            foreach (glob(app_path('Routes//Ask') . '/*.php') as $file) {
                $this->app->make('App\\Routes\\Ask\\' . basename($file, '.php'))->map($router);
            }
        });
    }
  
}
