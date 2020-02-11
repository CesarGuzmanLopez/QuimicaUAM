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
    	        { key:'Relation',label:'Relation',sortable:true }
    	    ],
    	    isBusy: false,
    	    totalRows: 1,
            currentPage: 1,
    	    filter: null,
            filterOn: ['Valor'],
            perPage: 15,
            pageOptions: [5, 10, 15],
            sortBy: '',
            sortDesc: false,
            Molecules:[] ,
            ActSRad:[],
            ActSolv:[],
            MolSelected:"2",
            RadSelected:"2",
            SolSelected:"1",
            TypSelected:"All",
            sortDirection: 'asc',
    	    items: 
            [],
            

    	}
    },
    async mounted() {
    	// Set the initial number of items
    	this.totalRows = this.items.length
        var formData = new FormData();           
        /*  Add the form data we need to submit */
        formData.append('appeal','Molecules');//peticion de datos
    	formData.append('IDSolvent',"1");
        formData.append('IDRadical',"2");
        formData.append('IDMolecule',"2");
     	formData.append('Type', "");
     	await axios.post('getCompareK_O', formData).then((response) =>{
        	this.Molecules =response.data;
        }); 
        formData.delete('appeal');
        formData.append('appeal','Radicals');//peticion de datos
        await axios.post('getCompareK_O', formData).then((response) =>{
        	this.ActSRad =response.data;
         });
        formData.delete('appeal');
        formData.append('appeal','Solvents');//peticion de datos
        await axios.post('getCompareK_O', formData).then( (response) =>{
        	this.ActSolv =response.data;
         });
        formData.delete('appeal');
        formData.append('appeal','Const');//peticion de datos
        await axios.post('getCompareK_O', formData).then( (response) =>{
        	this.items =response.data;
         });
        
    },
    computed: {},
    methods : {
    	changeMol(){
            this.ActSRad=[];
            this.ActSolv=[];
            this.items=[];
            this.RadSelected="";
            this.SolSelected="";
            var formData = new FormData();  
            formData.append('IDMolecule',this.MolSelected);
            formData.append('appeal','Radicals');
            axios.post('getCompareK_O', formData).then((response) =>{
            	this.ActSRad =response.data;
             });
                        
    	},
    	changeRad(){
            this.ActSolv=[];
            this.items=[];
            this.SolSelected="";
            var formData = new FormData();  
            formData.append('IDMolecule',this.MolSelected);
            formData.append('IDRadical',this.RadSelected);
            formData.append('appeal','Solvents');
            axios.post('getCompareK_O', formData).then((response) =>{
            	this.ActSolv =response.data;
             });
                        
    	},
    	changeSol(){
            this.items=[];
            var formData = new FormData();  
            formData.append('IDRadical',this.RadSelected);
            formData.append('IDSolvent',this.SolSelected);
            formData.append('Type',this.TypSelected);
             formData.append('appeal','Const');
            axios.post('getCompareK_O', formData).then((response) =>{
            	this.items =response.data;
             });
    	},
    
    	 onFiltered(filteredItems) {
    	        // Trigger pagination to update the number of buttons/pages due to filtering
    	        this.totalRows = filteredItems.length
    	        this.currentPage = 1
    	 },
    },
});