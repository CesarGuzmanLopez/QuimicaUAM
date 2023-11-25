<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class QDbRadical
 * 
 * @property int $ID_Radical
 * @property string $Name_Radical
 * @property string|null $Description
 * @property int|null $ID_Alta
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User|null $user
 * @property Collection|QDbKOverall[] $q_db_k_overalls
 *
 * @package App\Models
 */
class QDbRadical extends Model
{
	protected $table = 'q_db_radicals';
	protected $primaryKey = 'ID_Radical';

	protected $casts = [
		'ID_Alta' => 'int'
	];

	protected $fillable = [
		'Name_Radical',
		'Description',
		'ID_Alta'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'ID_Alta');
	}

	public function q_db_k_overalls()
	{
		return $this->hasMany(QDbKOverall::class, 'radical');
	}
}
