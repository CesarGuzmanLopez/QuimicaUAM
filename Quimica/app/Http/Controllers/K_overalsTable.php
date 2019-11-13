<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\q_db_k_overalls;

class K_overalsTable extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    { 
    	$koverralls = new  q_db_k_overalls;
    	Return $koverralls
    	->leftjoin('q_db_molecules','q_db_k_overalls.ID_Molecule', '=',  'q_db_molecules.ID')
    	->leftjoin('q_db_radicals' ,'q_db_k_overalls.radical','=','q_db_radicals.ID_Radical')
    	->leftjoin('q_db_solvents' ,'q_db_k_overalls.Solvent','=','q_db_solvents.ID_Solvent') 
    	->leftjoin('q_db_references' ,'q_db_k_overalls.id_reference','=','q_db_references.id_reference')
		->select('*')->get();
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
    }
}