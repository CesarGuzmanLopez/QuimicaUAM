<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration

{
    public function up()
    {
        Schema::create('password_resets', function (Blueprint $table) {
            $table->string('email', 191)->primary();
            $table->string('token', 191);
            $table->timestamps();
            $table->foreign('email')->references('email')->on('users');
        });
    }

    public function down()
    {
        Schema::dropIfExists('password_resets');
    }
};
