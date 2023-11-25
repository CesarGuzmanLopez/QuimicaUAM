<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class QDbKOverall
 * 
 * @property int $ID_K_OVERALL
 * @property int $ID_Molecule
 * @property int|null $radical
 * @property int|null $Solvent
 * @property float $Valor
 * @property string|null $pH
 * @property string $Tipo
 * @property string|null $Descripcion
 * @property int|null $ID_Alta
 * @property int|null $id_reference
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User|null $user
 * @property QDbMolecule $q_db_molecule
 * @property QDbReference|null $q_db_reference
 * @property QDbRadical|null $q_db_radical
 * @property QDbSolvent|null $q_db_solvent
 *
 * @package App\Models
 */
class QDbKOverall extends Model
{
	protected $table = 'q_db_k_overalls';
	protected $primaryKey = 'ID_K_OVERALL';

	protected $casts = [
		'ID_Molecule' => 'int',
		'radical' => 'int',
		'Solvent' => 'int',
		'Valor' => 'float',
		'ID_Alta' => 'int',
		'id_reference' => 'int'
	];

	protected $fillable = [
		'ID_Molecule',
		'radical',
		'Solvent',
		'Valor',
		'pH',
		'Tipo',
		'Descripcion',
		'ID_Alta',
		'id_reference'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'ID_Alta');
	}

	public function q_db_molecule()
	{
		return $this->belongsTo(QDbMolecule::class, 'ID_Molecule');
	}

	public function q_db_reference()
	{
		return $this->belongsTo(QDbReference::class, 'id_reference');
	}

	public function q_db_radical()
	{
		return $this->belongsTo(QDbRadical::class, 'radical');
	}

	public function q_db_solvent()
	{
		return $this->belongsTo(QDbSolvent::class, 'Solvent');
	}
}
