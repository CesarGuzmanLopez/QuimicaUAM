<template>
   <b-container fluid class="col-12 ">
   
   <div class="row text_font">   
   <div class="col-12 col-md-4 p-4 center-block bg-white img_max">
   <h3><b> {{selected.Name}}</b></h3>
        <b-img alt="" class="p-2 img_molecule"  fluid-grow :src="selected.img"/>
   </div > 
   <div class="col-12 pt-4  px-0   pr-md-0 col-md-8 pt-md-0 pl-md-4 ">
   
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
        <b-button size="sm"  class="fa fa-paper-plane mr-1" href="#info" @click="(row.item)"> <span class="text-white"> go </span></b-button>
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
    <div class="row p-1 " id="info">
   <transition name="fade">
         <div v-if="pKa_s.length>0" class="col-12 p-0  col-md-6 pr-md-4 ">
            <div id="PKA_S" class="pt-4  mt-4 contentDATA">
               <h3><b>Dissociaton Constants</b>  <span class="float-right"> {{selected.Name}}</span></h3>  
             <div class="col-12">
                  
                  <div v-for="(item, index) in pKa_s" >
                   <div v-if="index == 0 ||item.Tipo_Exp_teo !=pKa_s[index-1].Tipo_Exp_teo ">
                        <div  class="col-12 sub"  >
                           <div  v-if="item.Tipo_Exp_teo =='E' " >
                             <b>Experimental</b>
                           </div>
                           <div v-if="item.Tipo_Exp_teo =='T' " >
                             <b>Theoretical</b>  
                           </div> 
                        </div>
                        
                   </div> 
                    <div class="row "> 
                       <div class="col-1"></div>
                       <div class="col-4"> <b>Value:  <span class="pl-3">{{item.Value}}</span> </b></div>
                       <div class="col-3"  v-if="item.Site !='' && item.Site!=null"  data-toggle="tooltip" title="Site for image">Site: {{item.Site}}</div>
                       <div class="col-4" v-if="item.Description !='' && item.Description!=null"  data-toggle="tooltip" title="description regarding this value"><div>Description:</div> {{item.Description}}</div>           
                     <hr/>
                     </div>
                  </div>
                
                </div>
             </div>
         </div>
        </transition>
         
     <transition name="fade">
         <div v-if="K_Overals.length>0" class="col-12 col-md-6  pt-0 px-0">
            <div id="K_Ov" class=" pt-4 mt-4 contentDATA">
                <h3><b>Kinetic constants K<sub>overalls</sub></b> <span class="float-right"> {{selected.Name}}</span></h3> 
                
                <div class="col-12"> 
                  <div v-for="item in K_Overals ">
                    <div class="   col-12">
                    <span data-toggle="tooltip" :title="item.Valor.toFixed(0)" > {{item.Valor.toPrecision(2)}}</span>
                     </div>
                    <hr/>
                  </div>
                </div>
            </div>
         </div>
      </transition> 
</div>
   </b-container>  
</template>
<script>
  export default {
    data() {   
      return {
    	  tipo_pK:"",
    	  tipo_kO:"",
    	  
    	  inx:0,
    	  selected:{img:"img/gene.jpg",name:""},
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
          data_K_Overalls: [],
          data_pKa_s: [],
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
        cambiatipo_pk(valor){
        	this.tipo_pK=valor;
        },
        Selected(index){
        	//contador para los indices
        	this.tipo_pK="";
    	  	this.tipo_kO="";
         	//Primero camio la imagen
        	this.selected.img="files/data-base-img/"+index.item.ID+ "/"+index.item.Imagen;;
       		this.selected.Name=index.item.Name; 
       		for (var i = 0; i < this.data_pKa_s.length; i+=1) {
       		  if(this.data_pKa_s[i].id==index.item.ID ){
       			  this.pKa_s=[];
       			  this.K_Overals=[];
       			  this.pKa_s=this.data_pKa_s[i].data;
       			  this.K_Overals=this.data_K_Overalls[i].data;
				  return 0;  
       		  }   
       		}	
       		//despues seleciono unos pka especificos 
        		axios.get( 'PK_S/'+index.item.ID 
            ).then(response =>{ 
            	this.pKa_s = response.data;
           	    this.data_pKa_s.push({id:index.item.ID ,data:JSON.parse(JSON.stringify(response.data))});
            });  
     	   //despues seleccino unos KOverals
            axios.get( 'KOverals/'+index.item.ID 
            ).then(response =>{ 
           	    this.K_Overals = response.data; 
           		this.data_K_Overalls.push({id:index.item.ID ,data:  JSON.parse(JSON.stringify(response.data))});
  
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
      background-color:  #ffffff !important;
      min-height: 100px;
      padding: 10px;
      border-radius: 0px 40px 0px 10px !important;
      
    }
    .contentDATA h3{
      display:inline-block;
      width: 100%;
      border-bottom: 4px solid blue;
    }
.fade-enter-active, .fade-leave-active {
  transition: all .5s ease-in;
   opacity: 100;
   -webkit-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);
   -moz-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1); 
   -ms-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1); 
   -o-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1); 
   transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);
}
.fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
   opacity: 0;
   -webkit-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);

   -moz-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);

   -ms-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);

   -o-transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);

   transition: all 0.5s cubic-bezier(1, -0.5, 0.5, 1);

   height:0px;
  
}

    .text_font{
         font-size: .75rem !important;
    }
    .img_max{
       
    
    }
    .img_molecule{
      max-height: 340px;
    }
    .sub{
      font-size: 20px;
    }
    #BaseDatos {
   
    min-height: 100px;
    padding: 30px;
    margin-bottom: 30px;
   }
 </style>