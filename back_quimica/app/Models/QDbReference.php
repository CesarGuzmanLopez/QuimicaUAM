<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class QDbReference
 * 
 * @property int $id_reference
 * @property string $Reference
 * @property string|null $Coments
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|QDbKOverall[] $q_db_k_overalls
 * @property Collection|QDbPk[] $q_db_pks
 *
 * @package App\Models
 */
class QDbReference extends Model
{
	protected $table = 'q_db_references';
	protected $primaryKey = 'id_reference';

	protected $fillable = [
		'Reference',
		'Coments'
	];

	public function q_db_k_overalls()
	{
		return $this->hasMany(QDbKOverall::class, 'id_reference');
	}

	public function q_db_pks()
	{
		return $this->hasMany(QDbPk::class, 'id_reference');
	}
}
