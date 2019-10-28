@extends('layouts.app')


@section('content')   
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <div id="BaseDatos"> 
      <div class="table responsive  Molecule ">
        <!--Table-->
		<div class="row justify-content-center justify-content-md-start">
               <tabla></tabla>
       </div> 
       <!-- div row --> 
     </div>
      <!-- fin table de moleculas --> 
    </div>
   </div>
    <?= App\q_db_molecules::get()?>
        
@endsection

