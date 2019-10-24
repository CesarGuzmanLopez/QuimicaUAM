<!Doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]--><!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]--><!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
      <title>{{$title??"Chemistry"}}</title><!-- Meta Etiquetas  -->
      <meta name="author" content="Cesar Gerardo ,CesarGuzman@ieee.org">
      <meta name="copyright" content="Annia Galano"><link rel="icon"  href="{{asset($icon ?? '') }}">        <meta name="robots" content="index, follow" />
      <meta charset="utf-8"><meta name="language" content="en"><meta name="generator" content="Eclipse"><meta http-equiv="X-UA-Compatible" content="IE=edge"><base target ="_self">
	  <meta name="csrf-token" content="{{ csrf_token() }}">
     
     <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="Classification" content="Quimica "><meta name="msapplication-TileColor" content=" #009900" />
      <meta charset="utf-8">
      <!-- media -->
      <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">        
      <script type="text/javascript" src="{{asset('js/app.js') }}"></script>
      <link rel="stylesheet" type="text/css" href="{{ asset('css/principal.css') }}">        
      <!--@section('fondocss')-->
      <style type="text/css">
         #Container{
            background-size: 100%;
            background-image: url( "{{ asset('img/Fondo.svg') }}");
         }
      </style> 
      <!-- @show()-->
    </head>
    <body>
    <div id="Container" >
	 @section('header')  
   	  <header >
          <div class="border-bottom shadow-sm">
		  <nav class="navbar navbar-expand-md navbar-dark bg-secondary navbar-fixed-top   ">
		  
          <a class="navbar-brand col-3" href="{{url('/')}}">Computational chemistry and cheminformatic</a>
		<div class="col-5" ></div>  
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span> Menu
		  </button>
		  <div class="collapse navbar-collapse mr-auto col-4" id="navbarsExampleDefault">    
             <ul class="navbar-nav ">
		        <li class="nav-item active">
		             <a class="nav-link " href="#">Apps Desktop</a>
		        </li>
		        <li class="nav-item  active">
		          <a class="nav-link" href="#">Data base</a>
		        </li>
		        <!-- @guest-->
		        <li class="nav-item active">
		            <a class="nav-link active" href="{{ route('login') }}">{{ __('Login') }}</a>
		        </li>
		        <!--@if (Route::has('register'))-->
		        <li class="nav-item active">
		            <a class="nav-link " href="{{ route('register') }}">{{ __('Register') }}</a>
		        </li>
		        <!--@endif-->
		        <!--@else-->
			    <li class="nav-item dropdown">
		           <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">User: {{ Auth::user()->name }}</a>
		           <div class="dropdown-menu" aria-labelledby="dropdown01">
		             <a class="dropdown-item" href="{{ route('logout') }}"      onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
		                 {{ __('Logout') }}
		                
		              </a>
		               <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;"class="nav-link">
		                 @csrf
		              </form>
		           </div>    
		        </li>          
		        <!--@endguest-->
		      </ul>
		  </div>
		</nav>
       </div>
    </header> @show  
    <main class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto col-12" b="main">
    @section('content')
  
    @show
 
   @section('footer')
   <footer class="  fixed-bottom navbar-light bg-faded">
    <div class=" text-center py-3">© 2018 Copyright:
      <a href="https://www.agalano.com/"> Annia Galano's Group</a>
    </div>
   </footer>
   @show
    </div>
  </body>
</html>