<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class QDbMolecule
 * 
 * @property int $id
 * @property string $Name
 * @property string|null $RIS
 * @property string|null $SMILE
 * @property string|null $Imagen
 * @property string|null $Description
 * @property string|null $Active
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|QDbKOverall[] $q_db_k_overalls
 * @property Collection|QDbPk[] $q_db_pks
 *
 * @package App\Models
 */
class QDbMolecule extends Model
{
	protected $table = 'q_db_molecules';

	protected $fillable = [
		'Name',
		'RIS',
		'SMILE',
		'Imagen',
		'Description',
		'Active'
	];

	public function q_db_k_overalls()
	{
		return $this->hasMany(QDbKOverall::class, 'ID_Molecule');
	}

	public function q_db_pks()
	{
		return $this->hasMany(QDbPk::class, 'ID');
	}
}
