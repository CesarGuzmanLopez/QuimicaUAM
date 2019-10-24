<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class PrincipalController extends Controller
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
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

    	return view('Principal')->with('title',"Quimica A. G.");
    }
    public function BD()
    {	
    	return view('Principal')->with('title',"Base de datos");
    }
    public function userapi(Request $request) {
    	
    		return $request->user();
    }
}
