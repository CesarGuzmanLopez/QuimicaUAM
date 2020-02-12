@extends('layouts.app')
<?php 
function CreaTargeta($title, $urlImage, $description,$go, $link){?>
	<div  class="card cardPrincipal">
		<div class="row ">
            <? if($urlImage != ""){?>
			<div class="col-md-4">
			   <img src="<?=$urlImage?>" class="w-100">
			</div>
            <? }?>
			<div class="col-md-8 px-3">
				<div class="card-block px-3">
					<h4 class="card-title"><?=$title?></h4>
					<p class="card-text"> <?=$description?></p>
						<a href="<?=$link?>" class="btn btn-dark"><?=$go?></a>
				</div>
			</div> 
			</div>
		</div>

<?php 
};

?>
@section('content') 
  <article role="main" id="Presentation" class="  ">
    <div class="row ">
	     <div class="col-md-8">        
    	    <h1 class="cover-heading"> Annia Galano's Group</h1>    
		    <hr>
               <?php CreaTargeta("Data Base",asset('img/logoBD.svg'),"  Database of specific properties of molecules obtained experimentally or analytically using computational equipment","Data Base",url('Kinetics'));?>  
            <hr>
            <div class="lead">
		      <h3>Annia Galano</h3><a href="https://www.agalano.com/" class="btn btn-lg btn-secondary">agalano.com</a>
		    </div>
	    </div>
  
        <div class="col col-md-auto">
         <h1 class="cover-heading">Research interest</h1>
         <p class="lead">Computational Chemistry</p>
         <p class="lead">Oxidative Stress and antioxidants</p>
         <p class="lead">Ath  mosferic chemistry</p>          
        </div>
    </div>
  </article>
 
  

@endsection

