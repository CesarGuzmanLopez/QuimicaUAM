@extends('layoutPrincipal')
@section('content')
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  @include('header')
  
  <article role="main" class="inner cover bg-black">
    <div class="row">
	     <div class="col-8">
		    <h1 class="cover-heading"> Annia Galano's Group</h1>
		    
		    <p class="lead">
		      <a href="https://www.agalano.com/" class="btn btn-lg btn-secondary">agalano.com</a>
		    </p>
	    </div>
  
         
        <div class="col-4">
         <h1 class="cover-heading">Research interest</h1>
         
         <p class="lead">Computational Chemistry</p>
         
         <p class="lead">Oxidative Stress and antioxidants</p>
         
         <p class="lead">Atmosferic chemistry</p>
         
         <p class="lead"> </p>
         
         <p class="lead"> </p>          
        </div>
    </div>
    
   
  </article>
  
  <footer class="mastfoot mt-auto">
    <div class="inner">
    copyright
    </div>
  </footer>
</div>
@endsection

