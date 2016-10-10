<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IndexController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function home()
    {
        return view('welcome');
    }    

    /**
     * Process general application id
     *
     * @return \Illuminate\Http\Response
     */
    public function resources($id = null)
    {
        dd($id);

    }    
}
