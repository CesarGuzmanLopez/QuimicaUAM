<template>
  <b-container fluid>
    <!-- User Interface controls -->
    <b-row>
      <b-col lg="6" class="my-1">
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
              <b-button :disabled="!filter" @click="filter = ''">Clear</b-button>
            </b-input-group-append>
          </b-input-group>
        </b-form-group>
      </b-col>

      <b-col lg="6" class="my-1">
        <b-form-group
          label="Filter On"
          label-cols-sm="3"
          label-align-sm="right"
          label-size="sm"
          description="Leave all unchecked to filter on all data"
          class="mb-0">
          <b-form-checkbox-group v-model="filterOn" class="mt-1">
            <b-form-checkbox value="name">Name</b-form-checkbox>
            <b-form-checkbox value="SMILE">SMILE</b-form-checkbox>
            <b-form-checkbox value="Data">Data</b-form-checkbox>
          </b-form-checkbox-group>
        </b-form-group>
      </b-col>
      <b-col sm="7" md="6" class="my-1" >
        <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          align="fill"
          size="sm"
          class="my-0"
        ></b-pagination>
      </b-col>
    </b-row>

    <!-- Main table element -->
    <b-row>
    <b-col>
    <b-table
      striped hover
      
      show-empty
      small
      stacked="md"
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
      @row-clicked="imgAndData" 
    >
     
      <template v-slot:cell(name)="row"  >
        {{ row.value }}
      </template>
      
      <template v-slot:cell(actions)="row">
        <b-button size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
          Download Data
        </b-button>
        <b-button size="sm" @click="row.toggleDetails">
          {{ row.detailsShowing ? 'Hide' : 'Show' }} Details
        </b-button>
      </template>

      <template v-slot:row-details="row">
        <b-card>
          <ul>
            <li v-for="(value, key) in row.item" :key="key">{{ key }}: {{ value }}</li>
          </ul>
        </b-card>
      </template>
      
    </b-table>
    </b-col>
    <b-col lg="4"> <b-card
    :title="data_mole.Name"
    :img-src="data_mole.Image"
    img-alt="Image"
    img-top
    tag="article"
    class="p-4 "
    img-height="260px"
    fluid
   >
    <b-card-text>
     {{data_mole.Description}}
    </b-card-text>

    </b-card>
    </b-col>
    </b-row>
    <!-- Info modal -->
    <b-modal :id="infoModal.id" :title="infoModal.title" ok-only @hide="resetInfoModal">
      <pre>{{ infoModal.content }}</pre>
    </b-modal>
  </b-container>
</template>
<script>
  export default {
    data() {
      return {
        items: [
          { Active: true, SMILE: "...", Name:  'Cargando espere porfavor'},
          
        ],
        fields: [
          { key: 'Name', label: 'Molecule name', sortable: true, sortDirection: 'desc' },
          { key: 'SMILE', label: 'SMILE', sortable: false,click:'imgAndData',  class: 'text-center', lg:6 },
          /*{
            key: 'Active',
            label: 'is Active',
            formatter: (value, key, item) => {
              return value ? 'Yes' : 'No'
            },
            sortable: true,
            sortByFormatted: true,
            filterByFormatted: true
          },*/
          { key: 'actions', label: 'Actions' }
        ],
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
          id: 'info-modal',
          title: '',
          content: ''
        },
		data_mole:{
			id:'-1',
			Image: 'img/matrazRoto.png',
			Description:'',
			SMILE: '',
			Name: ''
			
		},
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
      // Set the initial number of items
      	this.totalRows = this.items.length
      	axios.get('getMolecules').then(response =>{
    	this.items = response.data;
    	this.totalRows = this.items.length
      });
      
    },
    
    methods: {
      info(item, index, button) {
        this.infoModal.title = `Row index: ${index}`
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
    	  this.data_mole.Image=  "files/data-base-img/"+item.ID+ "/"+item.Imagen;
    	  this.data_mole.Name=item.Name;
    	  axios.get('getMolecules/'+item.ID).then(response =>{
    	  	this.data_mole.Description= response.data;	
    	  });
    	  
      }
      
    }
  }
</script>