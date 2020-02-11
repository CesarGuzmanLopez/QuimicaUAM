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
    				<div class="col-5"><div class="row"><div class="col-12 col-md-6"><label>Reference component</label></div><div class="col-12 col-md-4">  
    				<select  class="form-control" @change="changeMol()"  v-model="MolSelected">
                      <option v-for="option in Molecules" v-bind:value="option.ID">
                       <?="  {{ option.Name }}"?>
                      </option>
					</select>
					
    				</div></div></div>
    				<div class="col-4"><div class="row"><div class="col-12 col-md-6"><label>Reference Radical  </label></div><div class="col-12 col-md-4"> 
 					 <select  class="form-control " @change="changeRad()"  v-model="RadSelected">
                      <option v-for="option in ActSRad" v-bind:value="option.ID_Radical">
                       <?="  {{ option.Name_Radical }}"?>
                      </option>
					 </select>
    				</div></div></div>
    				
    				
    				<div class="col-3"><div class="row"><div class="col-12 col-md-6"><label>Reference Solvent  </label></div><div class="col-12 col-md-4"> 
						<select  class="form-control " @change="changeSol()" v-model="SolSelected">
                          <option v-for="option in ActSolv" v-bind:value="option.ID_Solvent">
                           <?="  {{ option.Name_Solvent }}"?>
                          </option>
						</select>	
					</div></div></div>		
    					
    			</div>
    			<div class="row p-2">
    			<div class="col-md-4  col-0"></div><div class="pl-4 col-md-2 col-4" >	<input type="radio" name="type_e" value="All" v-model="TypSelected" @change="changeSol()"> All</div> 
    			<div class="col-4 col-md-3 pl-4"><input type="radio" name="type_e" value="Exp" v-model="TypSelected"@change="changeSol()" > Experimental</div>
    			<div class="col-md-3 pl-4 col-4"><input type="radio" name="type_e"  value="Theo" v-model="TypSelected" @change="changeSol()" > Theoretical </div>
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