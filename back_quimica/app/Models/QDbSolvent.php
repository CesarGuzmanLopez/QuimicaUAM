<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class QDbSolvent
 * 
 * @property int $ID_Solvent
 * @property string $Name_Solvent
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
class QDbSolvent extends Model
{
	protected $table = 'q_db_solvents';
	protected $primaryKey = 'ID_Solvent';

	protected $casts = [
		'ID_Alta' => 'int'
	];

	protected $fillable = [
		'Name_Solvent',
		'Description',
		'ID_Alta'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'ID_Alta');
	}

	public function q_db_k_overalls()
	{
		return $this->hasMany(QDbKOverall::class, 'Solvent');
	}

}
