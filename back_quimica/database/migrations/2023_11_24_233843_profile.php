<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('profile', function (Blueprint $table) {
            $table->foreignId('Usuario')->constrained('users', 'id');
            $table->string('Descripcion', 1000)->nullable();
            $table->string('imagen', 300)->nullable();
            $table->string('Grado', 10)->nullable();
            $table->timestamps();
            $table->primary('Usuario');
        });
    }

    public function down()
    {
        Schema::dropIfExists('profile');
    }
};