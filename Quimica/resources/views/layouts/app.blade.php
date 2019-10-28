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

      <link rel="stylesheet" type="text/css" href="{{ asset('css/principal.css') }}?<?=rand()?>">        
      <!--@section('fondocss')-->
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
      <style type="text/css">
         #Container{
            background-image: url( "{{ asset('img/Fondo.svg') }}");
             background-repeat: repeat;
         }
      </style> 
      <!-- @show()-->
    </head>
    <body>
   <div id="Container" >
    <div id="app">

	 @section('header')  
   	  <header >
	  
     <b-navbar toggleable="lg" type="dark" variant="dark">
	    <b-navbar-brand href="{{ url('/') }}">Computational chemistry and cheminformatic</b-navbar-brand>
	
	    <b-navbar-toggle target="nav-collapse">Menu</b-navbar-toggle>
	
	    <b-collapse id="nav-collapse" is-nav>
	      <b-navbar-nav>
	        <b-nav-item href="{{ url('Data-base') }}">Base Data</b-nav-item>
	        <b-nav-item href="#" disabled>Desktop apps</b-nav-item>
	      </b-navbar-nav>
	
	      <!-- Right aligned nav items -->
	      <b-navbar-nav class="ml-auto">
	
	        <b-nav-item-dropdown right>
	          <!-- Using 'button-content' slot -->
	          <template v-slot:button-content>
	            <em>User</em>
	          </template>
             
              <!-- @guest-->
              <b-dropdown-item href="{{ route('login') }}">{{ __('Login') }}</b-dropdown-item>
              <!--@if (Route::has('register'))-->
     
              <b-dropdown-item href="{{ route('register') }}">{{ __('Register') }}</b-dropdown-item>
             
              <!--@endif-->
              <!--@else-->
	          <b-dropdown-item href="{{ route('home') }}" > Home</b-dropdown-item>
	          <b-dropdown-item href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Sign Out</b-dropdown-item>
	       <!--@endguest-->
           
           </b-nav-item-dropdown>
	      
         </b-navbar-nav>
	    </b-collapse>
	  </b-navbar>
     </header>
     @show  
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
   </div>
      <script type="text/javascript" src="{{asset('js/app.js') }}?<?=rand()?>"></script>
      <script type="text/javascript" src="{{asset('js/principal.js') }}?<?=rand()?>"></script>
  </body>
</html>