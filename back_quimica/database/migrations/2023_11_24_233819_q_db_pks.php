<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('q_db_pks', function (Blueprint $table) {
            $table->id('id_pks');
            $table->foreignId('ID')->nullable()->constrained('q_db_molecules', 'ID');
            $table->text('Site');
            $table->char('Tipo_Exp_teo', 4)->nullable();
            $table->float('Value')->nullable();
            $table->foreignId('ID_Alta')->nullable()->constrained('users', 'id');
            $table->foreignId('id_reference')->nullable()->constrained('q_db_references', 'id_reference');
            $table->string('Description', 1000)->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('q_db_pks');
    }
};