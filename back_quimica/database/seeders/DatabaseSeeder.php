<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\WebApp;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //icono un matraz de ionic y un color verde claro

        $Koverall = new WebApp([
            'name' => 'Molecular kinetics Properties Database ',
            'version' => '0.1.0',
            'db_version' => '0.1.0',
            'url' => '/kinetics',
            'icon' => 'flask-outline',
            'color' => '#00ff00',
            'image' => asset('storage/img/k_overal.png'),
            'color_text' => '#ffffff',
        ]);
        $Koverall->save();
    }
}
