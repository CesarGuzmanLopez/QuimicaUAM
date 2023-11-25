<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration
{
    public function up()
    {
        Schema::create('q_db_k_overalls', function (Blueprint $table) {
            $table->id('ID_K_OVERALL');
            $table->foreignId('ID_Molecule')->constrained('q_db_molecules', 'ID');
            $table->foreignId('radical')->nullable()->constrained('q_db_radicals', 'ID_Radical');
            $table->foreignId('Solvent')->nullable()->constrained('q_db_solvents', 'ID_Solvent');
            $table->float('Valor');
            $table->string('pH', 10)->nullable();
            $table->string('Tipo', 30);
            $table->string('Descripcion', 100)->nullable();
            $table->foreignId('ID_Alta')->nullable()->constrained('users', 'id');
            $table->foreignId('id_reference')->nullable()->constrained('q_db_references', 'id_reference');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('q_db_k_overalls');
    }
};
