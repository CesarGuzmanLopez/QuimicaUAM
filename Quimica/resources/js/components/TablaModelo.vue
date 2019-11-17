<template>
   <b-container fluid class="bg-white">
   <div class="row">   
   <div class="col-12 col-md-4 tama">
   <h3><b> {{selected.Name}}</b></h3>
        <b-img alt="" class="p-4" fluid-grow :src="selected.img"/>
    
   </div>
   <div class="col-12 col-md-8 px-4 my-4" >
    <div class="row m-4">
  
     <b-form-input
        class="col-7 col-xl-4"
        v-model="filter"
        type="search"
        id="filterInput"
        placeholder="Type to Search"
      ></b-form-input>
    
        <b-button class="col-2 col-xl-1 mx-4" :disabled="!filter" @click="filter = ''"> Clear </b-button>
 
    <b-col  lg="12" xl="6" md="12" class="my-1">
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
       <div @click="imgsele(row)"> {{ row.value }} </div>
      </template>
      <template v-slot:cell(SMILE)="row" >
       <div @click="imgsele(row)"> {{ row.value }} </div>
      </template>
      <template v-slot:cell(pKa_K_Overall)="row">
        <div @click="imgsele(row)">
        <b-button size="sm"  class="fa   fa-save bg-info mr-1"  @click="(row.item)"> <span class="text-white"> Save info </span></b-button>
 
     </div>
      </template>
      <template v-slot:cell(Valor)="row"> 
         <div @click="imgsele(row)"> {{row.Value}}</div>
      </template>
      
      
      <template v-slot:cell(ris_image)="row">
         <div @click="imgsele(row)">
        <b-button size="sm" @click="row.toggleDetails" class="fa fa-file-text ">
          {{ row.detailsShowing ? 'Hide' : 'Show' }} RIS
        </b-button>
         </div>
      </template>
      
      <template v-slot:row-details="row">
       <div @click="imgsele(row)">
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
        imgsele(index){
         	this.selected.img="files/data-base-img/"+index.item.ID+ "/"+index.item.Imagen;;
       		this.selected.Name=index.item.Name;
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
    
 </style>