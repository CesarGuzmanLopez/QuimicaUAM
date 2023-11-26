<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class login extends Controller
{
    public function index()
    {
        //envio el codigo csrf para los formularios y codigo de conexion correcta
        return response()->json(['status' => 'ok', 'csrf' => csrf_token()]);
    }
    //verifico si el usuario existe
    public function login(Request $request)
    {
        $user = $request->input('user');
        $pass = $request->input('pass');
        $user = DB::table('q_db_users')->where('User', $user)->first();
        if ($user) {
            if ($user->Pass == $pass) {
                return response()->json(['status' => 'ok', 'user' => $user]);
            } else {
                return response()->json(['status' => 'error', 'message' => 'Contraseña incorrecta']);
            }
        } else {
            return response()->json(['status' => 'error', 'message' => 'Usuario no encontrado']);
        }
    }

}
