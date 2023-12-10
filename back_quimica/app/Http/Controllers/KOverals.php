<?php

namespace App\Http\Controllers;

use App\Models\QDbKOverall;
use Illuminate\Http\Request;

class KOverals extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $Koverals = QDbKOverall::all();

        return response()->json( $Koverals);
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
    public function show(QDbKOverall $qDbKOverall)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(QDbKOverall $qDbKOverall)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, QDbKOverall $qDbKOverall)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(QDbKOverall $qDbKOverall)
    {
        //
    }
}
