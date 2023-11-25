<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;


return new class extends Migration

{
    public function up()
    {
        Schema::create('q_db_molecules', function (Blueprint $table) {
            $table->id();
            $table->text('Name');
            $table->text('RIS')->nullable();
            $table->text('SMILE')->nullable();
            $table->text('Imagen')->nullable();
            $table->string('Description', 1000)->nullable();
            $table->string('Active', 15)->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('q_db_molecules');
    }
}
;