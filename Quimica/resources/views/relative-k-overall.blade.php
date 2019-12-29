@extends('layouts.app') 
@section('content')   
  <div class="cover-container d-flex col-md-11 px-md-4  p-0 col-12  m-0 p-0 mx-auto flex-column justify  ">
    <div id="BaseDatos" class="col-12 p-0 pt-4"> 
     <div class="Relative_K_O">
        <h1 class=" bg-white p-2 " >Relative kinetic effectiveness of compounds</h1>
    	<div class="bg-white p-0"> 	
    
    		<form>
    			<div class="row p-2">
    				<div class="col-4"><div class="row"><div class="col-6"><label>Reference component</label></div><div class="col-6"> <input></div></div></div>
    				<div class="col-4"><div class="row"><div class="col-6"><label>Reference Radical  </label></div><div class="col-6"> <input></div></div></div>
    				<div class="col-4"><div class="row"><div class="col-6"><label>Reference Solvent  </label></div><div class="col-6"> <input></div></div></div>		
    			</div>
    		</form>
    	</div>
     </div>
    </div>
   </div>
@endsection