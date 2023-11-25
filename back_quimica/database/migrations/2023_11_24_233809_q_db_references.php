<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;


return new class extends Migration
{
    public function up()
    {
        Schema::create('q_db_references', function (Blueprint $table) {
            $table->id('id_reference');
            $table->text('Reference');
            $table->text('Coments');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('q_db_references');
    }
};