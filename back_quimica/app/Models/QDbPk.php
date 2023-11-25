<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class QDbPk
 * 
 * @property int $id_pks
 * @property int|null $ID
 * @property string $Site
 * @property string|null $Tipo_Exp_teo
 * @property float|null $Value
 * @property int|null $ID_Alta
 * @property int|null $id_reference
 * @property string|null $Description
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User|null $user
 * @property QDbMolecule|null $q_db_molecule
 * @property QDbReference|null $q_db_reference
 *
 * @package App\Models
 */
class QDbPk extends Model
{
	protected $table = 'q_db_pks';
	protected $primaryKey = 'id_pks';

	protected $casts = [
		'ID' => 'int',
		'Value' => 'float',
		'ID_Alta' => 'int',
		'id_reference' => 'int'
	];

	protected $fillable = [
		'ID',
		'Site',
		'Tipo_Exp_teo',
		'Value',
		'ID_Alta',
		'id_reference',
		'Description'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'ID_Alta');
	}

	public function q_db_molecule()
	{
		return $this->belongsTo(QDbMolecule::class, 'ID');
	}

	public function q_db_reference()
	{
		return $this->belongsTo(QDbReference::class, 'id_reference');
	}
}
