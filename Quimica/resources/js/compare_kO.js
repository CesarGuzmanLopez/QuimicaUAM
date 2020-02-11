var Compare_kO = new Vue({
    el: '#Compare_kO', 
    data() {
    	return { 
    		fields: [
    			{ key:'Name', label: 'Molecule name', sortable: true },
    	        { key:'Name_Radical', label: 'Radical', sortable: true },
    	        { key:'Name_Solvent', label: 'Solvent', sortable: true },
    	        { key:'Valor', label: 'Value', sortable: true , variant: 'info'},
    	        { key:'pH', label:'pH', sortable: true },
    	        { key:'Tipo', label:'Type', sortable: true },
    	    ],
    	    isBusy: false,
    	    totalRows: 1,
            currentPage: 1,
    	    filter: null,
            filterOn: [],
            perPage: 15,
            pageOptions: [5, 10, 15],
            sortBy: '',
            sortDesc: false,
            Molecules:[] ,
            ActSolv:[],
            ActSRad:[],
    	
            sortDirection: 'asc',
    	    items: [
            	{Radical: -1, Solvent: -1, pH:null, Tipo:'Theo. with f_M', Valor:0, Descripcion:null, Reference:-1 },
            ],
            

    	}
    },
    mounted() {
    	// Set the initial number of items
    	this.totalRows = this.items.length
        var formData = new FormData();           
        /*  Add the form data we need to submit */
        formData.append('appeal','Molecules');//peticion de datos
    	formData.append('IDSolvent',"1");
        formData.append('IDRadical',"4");
        formData.append('IDMolecule',"2");
     	formData.append('Type', "Theo");
        axios.post('getCompareK_O', formData).then(response =>{
        	this.items =response.data;
        	console.log(response.data);
        });	
        
        
        
        
    },
    computed: {},
    methods : {
    	 onFiltered(filteredItems) {
    	        // Trigger pagination to update the number of buttons/pages due to filtering
    	        this.totalRows = filteredItems.length
    	        this.currentPage = 1
    	      },
    	      
    	
    	
    	
    	
    },
});