@extends('layoutPrincipal')
@section('content')
     <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="masthead mb-auto">
    <div class="inner">
      <h3 class="masthead-brand">Cover</h3>
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link active" href="#">Apps</a>
        <a class="nav-link" href="#">abaut</a>
        <a class="nav-link" href="#">Contact</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover">
    <h1 class="cover-heading">Quimica Annia Galano</h1>
    <p class="lead">
      
    </p>
    <p class="lead">
      <a href="#" class="btn btn-lg btn-secondary"></a>
    </p>
  </main>

  <footer class="mastfoot mt-auto">
    <div class="inner">
    </div>
  </footer>
</div>
@endsection
@section('addAssets')
         <link rel="stylesheet" type="text/css" href="{{ asset('css/principal.css') }}">        
@endsection
