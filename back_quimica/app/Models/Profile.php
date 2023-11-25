<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Profile
 * 
 * @property int $Usuario
 * @property string|null $Descripcion
 * @property string|null $imagen
 * @property string|null $Grado
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 *
 * @package App\Models
 */
class Profile extends Model
{
	protected $table = 'profile';
	protected $primaryKey = 'Usuario';
	public $incrementing = false;

	protected $casts = [
		'Usuario' => 'int'
	];

	protected $fillable = [
		'Descripcion',
		'imagen',
		'Grado'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'Usuario');
	}
}
