<template>
   <b-container fluid class="col-12 ">
   
   <div class="row text_font">   
   <div class="col-12 col-md-4 p-4 center-block bg-white">
   <h3><b> {{selected.Name}}</b></h3>
        <b-img alt="" class="p-4" fluid-grow :src="selected.img"/>
   </div >

   <div class="col-12 col-md-8 p-4 as pl-m-1">
   
   <div class="bg-white p-2 flex-column " >
    <div class="row mx-4 mb-3">
     <b-form-input
        class="col-7 col-xl-4"
        v-model="filter"
        type="search"
        id="filterInput"
        placeholder="Type to Search"
      ></b-form-input>  
      <b-button class="col-2 col-xl-1 mx-4" :disabled="!filter" @click="filter = ''"> Clear </b-button>
 
    <b-col  lg="12" xl="6" md="12" class="my-1 " >
        <b-form-group
          label-align-sm="right"
          label-size="sm"
 
          class="mb-0">
          <b-form-checkbox-group v-model="filterOn" class="mt-1">
            <b class="pr-2">Filter</b>
            <b-form-checkbox value="Name">Molecule</b-form-checkbox>
            <b-form-checkbox value="SMILE">Smile</b-form-checkbox>
            <b-form-checkbox value="RIS">RIS</b-form-checkbox>
          </b-form-checkbox-group>
        </b-form-group>
      </b-col>
 
 
    
    </div>
     <b-table
      id="moleculesTableShowDB"
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
      fixed
      noCollapse 
      outlined 
    >
    
      <template v-slot:table-busy>
        <div class="text-center text-dark my-2">
          <b-spinner small label="align-middle" variant="dark"></b-spinner>
          <strong>Loading...</strong>
        </div>
      </template>
    
      <template v-slot:cell(Name)="row" >
       <div @click="Selected(row)"> {{ row.value }} </div>
      </template>
      <template v-slot:cell(SMILE)="row" >
       <div @click="Selected(row)"> {{ row.value }} </div>
      </template>
      <template v-slot:cell(pKa_K_Overall)="row">
        <div @click="Selected(row)">
        <b-button size="sm"  class="fa   fa-save bg-info mr-1"  @click="(row.item)"> <span class="text-white"> Save info </span></b-button>
 
     </div>
      </template>
      <template v-slot:cell(Valor)="row"> 
         <div @click="Selected(row)"> {{row.Value}}</div>
      </template>
      
      
      <template v-slot:cell(ris_image)="row">
         <div @click="Selected(row)">
        <b-button size="sm" @click="row.toggleDetails" class="fa fa-file-text ">
          {{ row.detailsShowing ? 'Hide' : 'Show' }} RIS
        </b-button>
         </div>
      </template>
      
      <template v-slot:row-details="row">
       <div @click="Selected(row)">
        <b-card >
         <div v-if="row.item.Reference != null && row.item.Reference != 'null'">
             <b-form-textarea
               rows="6"
               max-rows="10"
               :value='row.item.Reference'
             ></b-form-textarea>
         </div>
         <div v-else-if="row.item.RIS != null">
             <b-form-textarea
               rows="6"
               max-rows="10"
               :value='row.item.RIS'
             ></b-form-textarea>
         </div>    
         
        </b-card>
        </div>
      </template>
    </b-table>
    <b-col sm="7" md="12" class="my-1">
      <b-pagination
       v-model="currentPage"
       :total-rows="totalRows"
       :per-page="perPage"
       align="fill"
       size="sm"
       class="my-0"
      ></b-pagination>
      <br/> 
    </b-col>
    </div>
    </div>
    </div>
    
         <transition
     name="fade"
            enter-active-class="res"
            leave-active-class="ocu"
         >
         <div v-if="pKa_s.length>0">
            <div id="PKA_S" class=" row pt-4  mt-4 contentDATA">
               <h3><b>pKa's</b></h3>  
               
               
             </div>
         </div>
        </transition>
         
       <transition
        name="fade"
             enter-active-class="res"
            leave-active-class="ocu"
         >
         <div v-if="K_Overals.length>0">
            <div id="K_Ov" class="row pt-4 mt-4 contentDATA">
                <h3><b>K<sub>overalls</sub></b></h3> 
                
            </div>
         </div>
      </transition> 

   </b-container>  
</template>
<script>
  export default {
    data() {   
      return {
    	  selected:{img:"img/matrazRoto.png",name:""},
    	  isBusy: true,
    	  items:[],
    	  totalRows:0,
    	  totalRows: 1,
          currentPage: 1,
          perPage: 8,
          pageOptions: [5, 10, 15],
          sortBy: '',
          sortDesc: false,
          sortDirection: 'asc',
          filter: null,
          filterOn: [],
          pKa_s: [],
          K_Overals: [],
          
          fields: [
            { key:'ID',label:'id', variant: 'success',thStyle: { backgroundColor: '#3eef33' ,width: "30px"}},
            { key:'Name', label: 'Molecule', sortable: true, 'class': 'my-clas'},
            { key:'SMILE', label: 'Smile', sortable: true ,thStyle: { width: "210px"}},
            { key:'ris_image', label: 'RIS'  },
            { key:'pKa_K_Overall', label: 'Info'  },
          ],
      }  
    },
    
    computed: {
    	sortOptions() { 
    		return this.fields.filter(f => f.sortable).map(
    		f => {return { text: f.label, value: f.key }})
    	}
    },
    mounted() {
        // Set the initial number of items
        this.totalRows = this.items.length
        axios.get('getMolecules').then(response =>{
           this.items = response.data;
           this.isBusy= false;
            this.totalRows = this.items.length; 
        }); 
    },
    methods: { 
        onFiltered(filteredItems) {
          this.totalRows = filteredItems.length
          this.currentPage = 1
        },
        Selected(index){
         	//Primero camio la imagen
        	this.selected.img="files/data-base-img/"+index.item.ID+ "/"+index.item.Imagen;;
       		this.selected.Name=index.item.Name;
       		//despues seleciono unos pka especificos 
            this.pKa_s = [];
            
  
            
            
       		axios.get( 'PK_S/'+index.item.ID 
            ).then(response =>{ 
         	   	console.log(response.data);	 
           	    this.pKa_s = response.data;
         	/*	if(this.pKa_s.length>0)
                   $("#PKA_S").addClass("res").removeClass("ocu"); 
                else 
         		   $("#PKA_S").removeClass("res").addClass("ocu");
              */  
             });
       		
       
     	   //despues seleccino unos KOverals
            this.K_Overals= [];  
            axios.get( 'KOverals/'+index.item.ID 
            ).then(response =>{ 
         	   	console.log(response.data);	 
           	    this.K_Overals = response.data; 
    /*
           	    if(this.K_Overals.length>0)
                   $("#K_Ov").addClass("res").removeClass("ocu"); 
                 else 
           		   $("#K_Ov").removeClass("res").addClass("ocu");
      */            
             });
            
        },
    }
 }
 </script>
 <style>
    .tama{
       min-height: 100px;
    }
    .Wcol{
     max-width: 3px;
    }
    .infoCol{
    
    }
    .as{ 
      padding: 0px !important;
      padding-left:20px !important;
      
    }
    .trans{
       
    }

    .contentDATA{
      background-color:  #dee2e6 !important;
      min-height: 100px;
      padding: 10px;
      border-radius: 0px 40px 0px 40px !important;
      
    }
    
    .fade-enter-active, .fade-leave-active {
      transition: opacity .5s;
       
    }
    .fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
      opacity: 0;
    }
    .text_font{
         font-size: .75rem !important;
    }
 </style>