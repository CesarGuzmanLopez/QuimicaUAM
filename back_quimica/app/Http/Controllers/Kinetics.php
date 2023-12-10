<?php

namespace App\Http\Controllers;

use App\Models\QDbMolecule;
use App\Models\QDbRadical;
use App\Models\QDbReference;
use App\Models\QDbSolvent;
use App\Models\WebApp;
use Illuminate\Http\Request;

class Kinetics extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //devuelbo todas las moleculas
        $versionDB = WebApp::all()->first()->version;
        return response()->json([
            'versionDB' => $versionDB,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        if( $id == 'molecules' ){
            $moleculas = QDbMolecule::all();
            return response()->json( $moleculas);
        }
        if( $id == 'solventes' ){
            $solventes = QDbSolvent::all();
            return response()->json( $solventes);
        }
        
        if( $id == 'referecias' ){
            $referecias = QDbReference::all();
            return response()->json( $referecias);
        }
        if( $id == 'radicals' ){
            $radicals = QDbRadical::all();
            return response()->json( $radicals);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
