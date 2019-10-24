<!Doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]--><!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]--><!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<html>
    <head>
      <title>{{$title??"Chemistry"}}</title><!-- Meta Etiquetas  -->
      <meta name="author" content="Cesar Gerardo ,CesarGuzman@ieee.org">
      <meta name="copyright" content="Annia Galano"><link rel="icon"  href='{{asset("$icon") }}'>        <meta name="robots" content="index, follow" />
      <meta charset="utf-8"><meta name="language" content="en"><meta name="generator" content="Eclipse"><meta http-equiv="X-UA-Compatible" content="IE=edge"><base target ="_self">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="Classification" content="Quimica "><meta name="msapplication-TileColor" content=" #009900" />
      <meta charset="utf-8">
      <!-- media -->
      <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">        
      <script type="text/javascript" src="{{asset('js/app.js') }}"></script>
      <link rel="stylesheet" type="text/css" href="{{asset('css/principal.css')}}">
    </head>
    <body>
    <div id="Container" class="black">
    @section('content')
    @show
    </div>
    </body>
</html>