<?php

namespace App\Http\Controllers;

use App\Models\WebApp;
use Illuminate\Http\Request;

class AppsWeb extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $apps = WebApp::all();
        return response()->json( $apps);
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
    public function show(WebApp $webApp)
    {
        //regreso la 
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(WebApp $webApp)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, WebApp $webApp)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(WebApp $webApp)
    {
        //
    }
}
