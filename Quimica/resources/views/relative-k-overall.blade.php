@extends('layouts.app') 
@section('content')  
  <div id="aux"></div> 
  <div class="cover-container d-flex col-md-11 px-md-4  p-0 col-12  m-0 p-0 mx-auto flex-column justify  ">
    <div id="BaseDatos" class="col-12 p-0 pt-4"> 
     <div id="Compare_kO">
        <h1 class=" bg-white p-2 " >Relative kinetic effectiveness of compounds</h1>
    	<div class="bg-white p-2 mb-2"> 	 
    		<form>
    			<div class="row p-2">
    				<div class="col-5"><div class="row"><div class="col-12 col-md-6"><label>Reference component</label></div><div class="col-12 col-md-4"> <input type="text" size="15"> </div></div></div>
    				<div class="col-4"><div class="row"><div class="col-12 col-md-6"><label>Reference Radical  </label></div><div class="col-12 col-md-4"> <input type="text" size="7"> </div></div></div>
    				<div class="col-3"><div class="row"><div class="col-12 col-md-6"><label>Reference Solvent  </label></div><div class="col-12 col-md-4"> <input type="text" size="7"> </div></div></div>		
    			</div>
    			<div class="row p-2">
    			<div class="col-md-4  col-0"></div><div class="pl-4 col-md-2 col-4">	<input type="radio" name="type_e" value="All"> All</div> <div class="col-4 col-md-3 pl-4"><input type="radio" name="type_e" value="Exp" > Experimental</div><div class="col-md-3 pl-4 col-4"><input type="radio" name="type_e"  value="Theo"> Theoretical </div>
    			</div>
    		</form>
    	</div>
    	<div class=""> 
    	<div class="table-responsive bg-white p-2">
   		<!-- inicia la tabla -->    	
    	    <b-table
              show-empty
              small
              stacked="md"
              
              responsive="sm"
              striped 
              hover small
              :items="items"
              :fields="fields"
              :current-page="currentPage"
              :per-page="perPage"
              :filter="filter"
              :filterIncludedFields="filterOn"
              :sort-by.sync="sortBy"
              :sort-desc.sync="sortDesc"
              :sort-direction="sortDirection"
              @filtered="onFiltered"
              :busy="isBusy"
            >
            <template>
           
            </template>
			<template>
			
			</template>


		    </b-table>


    	<!-- fin tabla -->
    	</div>
     	</div>
     </div>
    </div>
   </div>
@endsection