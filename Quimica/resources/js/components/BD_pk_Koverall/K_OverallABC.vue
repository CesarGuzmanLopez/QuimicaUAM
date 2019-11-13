<template>
  <b-container fluid class="bg-white p-2">
    <h1>pKa's table</h1>
    <!-- User Interface controls -->
      <b-col lg="12" class="my-1">
        <b-form-group
          label="Filter"
          label-cols-sm="3"
          label-align-sm="right"
          label-size="sm"
          label-for="filterInput"
          class="mb-0"
        >
          <b-input-group size="sm">
            <b-form-input
              v-model="filter"
              type="search"
              id="filterInput"
              placeholder="Type to Search"
            ></b-form-input>
            <b-input-group-append>
              <b-button :disabled="!filter" @click="filter = ''"> Clear </b-button>
            </b-input-group-append>
           <div>
         <b-button  @click="modaladdpk" class="fa fa-save bg-success mx-4"> Add molecule</b-button>
         </div>
           </b-input-group>
          
        </b-form-group>
     
      </b-col>



    <!-- Main table element -->
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
      <template v-slot:table-busy>
        <div class="text-center text-dark my-2">
          <b-spinner small label="align-middle" variant="dark"></b-spinner>
          <strong>Loading...</strong>
        </div>
      </template>
    
      <template v-slot:cell(Name)="row">
        {{ row.value }} 
      </template>

      <template v-slot:cell(actions)="row">
        <b-button size="sm"  class="fa fa-trash   bg-danger  mr-1"  @click="Delete_id(row.item)"> <span class="text-info"> Delete </span></b-button>
        <b-button size="sm"  class="fa fa-refresh bg-warning mr-1" @click="showmodal(row.item)"> <span class="text-info"> Actualize </span> </b-button>
    
      </template>
      <template v-slot:cell(Valor)="row"> 
         {{row.item.Valor.toPrecision(2)}}
      </template>
      
      
      <template v-slot:cell(ris_image)="row">
        <b-button size="sm" @click="row.toggleDetails" class="fa fa-file-text ">
          {{ row.detailsShowing ? 'Hide' : 'Show' }} Reference
        </b-button>
      </template>
      
      <template v-slot:row-details="row">
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
      <div class="p4 d-flex align-items-end">
	     <h1 class="fa fa-exclamation-circle text-success mt-auto p-2  mr-4 ">{{ addMoleMensaje}}</h1>
      </div>
   
    <b-modal :id="infoModal.id" :title="infoModal.title" ok-only @hide="resetInfoModal">
     <b-img :src='data_mole.Image'/>
    </b-modal> 
    
    <b-modal ref="AddPK" id="AddPK" title="AddPK"   hide-footer>
 
   </b-modal>
   
   
   
    <b-modal ref="updatemole" id="updatemole" title="Update molecule"   hide-footer>
      <b-container fluid>
       <form enctype="multipart/form-data">
         
         <b-row>
            <div class="border border-info col-12 mt-4 p-4">ID_K_OVERALL: {{formodifi.ID_K_OVERALL}}</div> 
             <p><label  for="formodifi.Mol_name" class="p-2">Molecule Name</label></p>
             <b-input
               id="formodifi.Name"
               v-model="formodifi.Name"
               class="mb-2 mr-sm-2 mb-sm-0"
               placeholder="Molecule Name"
               name="Mol_name"
             ></b-input>
             <label  for="formodifi.SMILE">Smile</label>
             <b-input-group class="mb-2 mr-sm-2 mb-sm-0">
               <b-input id="formodifi.SMILE" v-model="formodifi.SMILE" placeholder="Smile"></b-input>
             </b-input-group>
         
                 <b-col sm="2"class="mt-4">
               <label for="formodifi.Description">Description</label>
             </b-col>
             <b-col sm="10"  class="mt-4">
             <b-form-textarea
                 id="formodifi.Description"
                 v-model="formodifi.Description"
                 size="sm"
                 placeholder="Small Description"
             ></b-form-textarea>
             </b-col>
               <div class="border border-info col-12 mt-4">
               <b-col sm="2"class="mt-4">
                  <h4><label for="formodifi.RIS" >RIS:</label></h4>
             </b-col>
              <b-col sm="12" class="my-4" >
              <b-form-file class="m-3" @change="loadTextFromFile" id="formodifi.RISFile" plain></b-form-file>
                <b-form-textarea
                v-model="formodifi.RIS"
                 id="formodifi.RIS"
                 name="RIS"
                 placeholder="RIS"
               ></b-form-textarea>
             </b-col>
             </div>
         </b-row>
         <b-row>
             <div class="border border-info col-12 mt-4">
                 <label for="formodifi.imagemol" class="p-1"
                 >Molecule image</label>
                 : {{formodifi.Image}}
                 <input class="p-3" type="file" ref="formodifi_imagemol" v-on:change="handleFileUploadup()" id="formodifi_imagemol" name="imagemol"  accept="image/*">
             </div>
         </b-row>
       </form>
       
      </b-container>
     <div class="row">
        <b-button  block  class="fa fa fa-refresh m-3  p-2 col-3 bg-success mx-4" @click = "updateMolelcule()" >actualize molecule</b-button>
        <b-button  block @click="$bvModal.hide('updatemole')" class=" m-3  p-2 col-3 bg-danger mx-4">Cerrar</b-button>    
     </div>
   </b-modal>
   
   
  </b-container>

</template>

<script>

  export default {
  	data() {   
      return {
      isBusy:true,
      formNewnMole: {
         ID_K_OVERALL:'',
         Name: '',
         SMILE: '',
         Description:'',
         RIS:'',
         Image: '',
      },
      formodifi: {
         ID_K_OVERALL:'',
         Name: '',
         SMILE: '',
         Description:'',
         RIS:'',
         Image: '',
      },
        items: [
          { Active: true, SMILE: "...", Name:  'Cargando espere porfavor'},
        ],
        addMoleMensaje:'',
        fields: [
          { key:'ID_K_OVERALL',label:'id', variant: 'success', dblclick:"unmsj(row,$event)"},
          { key:'Name', label: 'Molecule name', sortable: true },
          { key:'Name_Radical', label: 'Radical', sortable: true },
          { key:'Name_Solvent', label: 'Solvent', sortable: true },
          { key:'Valor', label: 'Value', sortable: true , variant: 'info'},
          { key:'pH', label:'pH', sortable: true },
          { key:'Tipo', label:'Type', sortable: true },
          { key:'Descripcion', label: 'Description'  },
          { key:'ris_image', label: 'Reference'},
          { key:'actions', label: 'Actions' },
        ],        
       NewPK: {
   			id_Molecule:0,
        	id_Radical:0 ,
        	id_Solvent:0,
        	Value:0,
        	pH: 7 ,
        	Type: "Theoretical",
        	Description:"" ,
        	Id_Reference: "",
        	
       },
        totalRows: 1,
        currentPage: 1,
        perPage: 5,
        pageOptions: [5, 10, 15],
        sortBy: '',
        sortDesc: false,
        sortDirection: 'asc',
        filter: null,
        filterOn: [],
        
        infoModal: {
          id: '-1',
          title: '',
          content: ''
        },
      data_mole:{
         id:'0',
         Image: '../../img/matrazRoto.png',
         Description:'',
         SMILE: '',
         Name: '',
         RIS:'',
      },
      itemsMolecules:{},
      itemsferences:{},
      itemsSolvents:{},
      itemsRadicals:{},
      
      }
     
      
    } ,

    computed: {
      sortOptions() {
    	  
        // Create an options list from our fields
        return this.fields
          .filter(f => f.sortable)
          .map(f => {
            return { text: f.label, value: f.key }
          })
      }
    },
    mounted() {
 	   this.getReferences();
	   this.getMolecules();
	   this.getSolvents();
	   this.getRadicals();

      // Set the initial number of items
         this.totalRows = this.items.length
         axios.get('../../K_overalsTable').then(response =>{
      this.items = response.data;
      this.totalRows = this.items.length;
     console.log(this.items);
      this.isBusy= false;
      });
      
    },
    methods: {
      info(item, index, button) {
        this.imgAndData(item, index, event) 
        this.infoModal.title = item.Name;
        this.infoModal.content = JSON.stringify(item, null, 2)
        this.$root.$emit('bv::show::modal', this.infoModal.id, button)
      }, 
      resetInfoModal() {
        this.infoModal.title = ''
        this.infoModal.content = ''
      },
      onFiltered(filteredItems) {
        // Trigger pagination to update the number of buttons/pages due to filtering
        this.totalRows = filteredItems.length
        this.currentPage = 1
      },
      imgAndData(item, index, event){  
      this.data_mole.Image=  "../../files/data-base-img/"+item.ID_K_OVERALL+ "/"+item.Imagen;
      this.data_mole.Name=item.Name;
       
      },
      clearaddmol(){
      this.formNewnMole.Name='';
      this.formNewnMole.SMILE= '';
      this.formNewnMole.Description='';
      this.formNewnMole.RIS='';
      this.formNewnMole.Image= '';
      },
      
      addMolelcule(){
      var key, count = 0;
      if(this.formNewnMole.Name==="" || this.formNewnMole.SMILE==="" ) {
         alert("Name or Smile cannot be empty");
         this.addMoleMensaje= (this.formNewnMole.Name)+"Error ";
         return 0;
      }
      

      for(key in this.items ) {
       if(this.items[key].Name.toUpperCase() ===this.formNewnMole.Name.toUpperCase() || 
         this.items[key].SMILE.toUpperCase()=== this.formNewnMole.SMILE.toUpperCase() ){
         alert("this Molecule or Smile Exists");
         this.addMoleMensaje= (this.formNewnMole.Name)+"Error ";
         return 0;
       }
      }
       /* Initialize the form data */
       var formData = new FormData(); 
         
       /*  Add the form data we need to submit */
       formData.append('Image', this.formNewnMole.Image);
       formData.append('Name', this.formNewnMole.Name);
       formData.append('SMILE', this.formNewnMole.SMILE);
       formData.append('Description', this.formNewnMole.Description);
       formData.append('RIS', this.formNewnMole.RIS);
       
       /* Make the request to the POST ../../K_overalsTable URL */
       axios.post( '../../K_overalsTable',formData,{
       headers: { 'Content-Type': 'multipart/form-data'}}
       ).then(response =>{ 
            console.log(response.data);    
            this.addMoleMensaje=  ' _ '+ this.formNewnMole.Name +" add successful";
         }
       ).catch(function(){ this.addMoleMensaje= (this.formNewnMole.Name)+"Error ";}); 
         
       axios.get('../../K_overalsTable').then(response =>{
      this.items = response.data;
      this.totalRows = this.items.length;
       });
       
       this.clearaddmol();
      
       axios.get('../../K_overalsTable').then(response =>{
         this.items = response.data;
         this.totalRows = this.items.length;
      });
       this.$refs['addmole'].hide();
      },
      handleFileUpload(){
        this.formNewnMole.Image = this.$refs.formNewnMole_imagemol.files[0];

      },
      handleFileUploadup(){
        this.formodifi.Image = this.$refs.formodifi_imagemol.files[0];

      },
      loadTextFromFile(ev) {
          const file = ev.target.files[0];
          const reader = new FileReader();
          reader.onload = e => {
           this.formodifi.RIS=e.target.result
           this.formNewnMole.RIS =e.target.result};
          reader.readAsText(file);
       },
       Delete_id(index){
         
              this.$bvModal.msgBoxConfirm('Please confirm that you want to delete "'+index.Name +'".', {
                title: 'Please Confirm',
                size: 'sm',
                buttonSize: 'sm',
                okVariant: 'danger',
                okTitle: 'YES',
                cancelTitle: 'NO',
                footerClass: 'p-2',
                hideHeaderClose: false,
                centered: true
              })
              .then(value => {
              if(value ===true){
                  axios.delete( '../../K_overalsTable/'+index.ID_K_OVERALL).then(
                  response =>{ 
                     axios.get('../../K_overalsTable').then(response =>{
                           this.items = response.data;
                           this.totalRows = this.items.length;
                           
                     });
 
                  }).catch(function(){ this.addMoleMensaje= (this.formNewnMole.Name)+"Error ";});              
              }
                  
             })
             .catch(err => {
               // An error occurred
             });
              this.addMoleMensaje=  ' _ '+ this.formNewnMole.Name +" add successful";
              
           
       },
       showmodal(index){
      this.formodifi.ID_K_OVERALL=index.ID_K_OVERALL;
       this.formodifi.Image="";
       this.formodifi.Name=index.Name;
       this.formodifi.SMILE=index.SMILE;
       this.formodifi.Description=index.Description;
       this.formodifi.RIS=index.RIS;
      this.$refs['updatemole'].show();
       },
       updateMolelcule(){
         var key, count = 0;
            if(this.formodifi.Name==="" || this.formodifi.SMILE==="" ) {
               alert("Name or Smile cannot be empty");
            this.addMoleMensaje= (this.formodifi.Name)+"Error ";
            return 0;
         }
            

         for(key in this.items ) {
          if((this.items[key].Name.toUpperCase() ===this.formodifi.Name.toUpperCase() || 
            this.items[key].SMILE.toUpperCase()=== this.formodifi.SMILE.toUpperCase()) && this.formodifi.ID_K_OVERALL != this.items[key].ID_K_OVERALL ){
            alert("this Molecule or Smile Exists");
            this.addMoleMensaje= (this.formodifi.Name)+"Error ";
            return 0;
          }
         }
           /* Initialize the form data */
           var formData = new FormData(); 
             
           /*  Add the form data we need to submit */
           if(this.formodifi.Image !="")
               formData.append('Image', this.formodifi.Image); 
           formData.append('Name', this.formodifi.Name);
           formData.append('SMILE', this.formodifi.SMILE);
           formData.append('Description', this.formodifi.Description);
           formData.append('RIS', this.formodifi.RIS);
           formData.append('_method','PUT');
           console.log(this.formodifi.Name +" + "+this.formodifi.SMILE)
           
           /* Make the request to the POST ../../K_overalsTable URL */
           axios.post( '../../K_overalsTable/'+this.formodifi.ID_K_OVERALL,formData,{
           headers: { 'Content-Type': 'multipart/form-data'}}
           ).then(response =>{ 
               console.log(response.data);    
               this.addMoleMensaje=  ' _ '+ this.formodifi.Name +" modify successful";
            }
           ).catch(function(){ this.addMoleMensaje= (this.formodifi.Name)+"Error ";}); 
           
           this.clearaddmol();
          
           axios.get('../../K_overalsTable').then(response =>{
            this.items = response.data;
            this.totalRows = this.items.length;
    
             });
           this.$refs['updatemole'].hide();
       },
       
       getMolecules(){
    	   axios.get('../../MoleculeTable').then(response =>{
    		   this.itemsMolecules=response.data;
 
		   });
       },

       getReferences(){
    		axios.get('../../ReferencesTable').then(response =>{

    			this.itemsferences=response.data;
 
 		   });
       },
 	      
       getSolvents(){
     		axios.get('../../SolventsTable').then(response =>{

     			this.itemsSolvents= response.data;
 
 		   });
       },
       getRadicals(){
  		axios.get('../../RadicalsTable').then(response =>{
 		this.itemsRadicals = response.data;
 
  		});
       },
       modaladdpk(){
    	   this.$refs['AddPK'].show();
    	   
			console.log("Radicals\n"+  JSON.stringify(this.itemsRadicals));  
			console.log("Molecules\n"+ JSON.stringify(this.itemsMolecules));  
			console.log("Referemces\n"+JSON.stringify(this.itemsferences));  
			console.log("Radicals\n"+  JSON.stringify(this.itemsSolvents));
       }
       ,
  }
  }
  
</script>