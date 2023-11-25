<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class DataBasesQ
 * 
 * @property int $id
 * @property string $Name
 * @property string $prefix
 * @property string|null $Description
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @package App\Models
 */
class DataBasesQ extends Model
{
	protected $table = 'data_bases_q_s';

	protected $fillable = [
		'Name',
		'prefix',
		'Description'
	];
}
