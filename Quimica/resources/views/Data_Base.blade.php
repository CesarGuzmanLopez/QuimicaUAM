@extends('layouts.app')

@section('content')



   <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <div id="BaseDatos"> 
     
     <div class="table responsive  Molecule ">
        <!--Table-->
		<div class="row justify-content-center justify-content-md-start">

	        <div class="col-md-8 Tabla_Datos_Moleculas">
		     <div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length"><h1>Molecular Properties</h1></div></div><div class="col-sm-12 col-md-6"><div id="example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example"></label></div></div></div>
      	
         	<table class="table ">
				  <!--Table head-->
				  <thead>
				    <tr>
				      <th>#</th>
				      <th  class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"  >Molecule name</th>
				      <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">S.M.I.L.E.</th>
				    </tr>
				  </thead>
				  <!--Table head-->
				
				  <!--Table body-->
				  <tbody>
				    <tr class="table-info">
				      <th scope="row">1</th>
				      <td>Kate</td>
				      <td>Moss</td>
				   
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Anna</td>
				      <td>Wintour</td>
				
				    </tr>
				    <tr class="table-info">
				      <th scope="row">3</th>
				      <td>Tom</td>
				      <td>Bond</td>
				
				    </tr>
				    <tr>
				      <th scope="row">4</th>
				      <td>Jerry</td>
				      <td>Horwitz</td>
				
				    </tr>
				    <tr class="table-info">
				      <th scope="row">5</th>
				      <td>Janis</td>
				      <td>Joplin</td>
				
				    </tr>
				    <tr>
				      <th scope="row">6</th>
				      <td>Gary</td>
				      <td>Winogrand</td>
				
				    </tr>
				    <tr class="table-info">
				      <th scope="row">7</th>
				      <td>Angie</td>
				      <td>Smith</td>
				
				    </tr>
				    <tr>
				      <th scope="row">8</th>
				      <td>John</td>
				      <td>Mattis</td>
				
				    </tr>
				    <tr class="table-info">
				      <th scope="row">9</th>
				      <td>Otto</td>
				      <td>Morris</td>
				    </tr>
				  </tbody>
				  <!--Table body-->
				</table>
				<!--Table-->
                <ul class="pagination justify-content-center align-items-center">
                    <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            
               </div>
              <div>

         
            </div>
	        <!-- col -->
	        <div class="col-md-4  image_molecule  ">
            <div class="" >
               <div class="card-body">
                  <img class="card-img img-fluid mb-1 card-img-molecula" src=" " alt="Card image cap">
                  <h4 class="card-title">Card title</h4>
                  <p class="card-text">Sweet halvah dragée jelly-o halvah carrot cake oat cake. Donut jujubes
                     jelly chocolate cake marzipan chocolate chocolate bar.</p>
               </div>
            </div>
  

	        </div>
       </div> 
       <!-- div row --> 
     </div>
     
    </div>
   </div>
@endsection

