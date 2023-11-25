<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('q_db_radicals', function (Blueprint $table) {
            $table->id('ID_Radical');
            $table->string('Name_Radical');
            $table->string('Description', 400)->nullable();
            $table->foreignId('ID_Alta')->nullable()->constrained('users', 'id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('q_db_radicals');
    }
};
