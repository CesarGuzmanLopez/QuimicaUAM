<?php

namespace App\Http\Controllers;

use App\Models\QDbPk;
use Illuminate\Http\Request;

class PK extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $PKs = QDbPk::all();
        return response()->json( $PKs);
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
    public function show(QDbPk $qDbPk)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(QDbPk $qDbPk)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, QDbPk $qDbPk)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(QDbPk $qDbPk)
    {
        //
    }
}
