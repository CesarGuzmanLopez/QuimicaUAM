<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class WebApp
 * 
 * @property int $id
 * @property string $name
 * @property string $version
 * @property string $db_version
 * @property string $url
 * @property string|null $icon
 * @property string|null $color
 * @property string|null $image
 * @property string|null $color_text
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class WebApp extends Model
{
	protected $table = 'web_apps';

	protected $fillable = [
		'name',
		'version',
		'db_version',
		'url',
		'icon',
		'color',
		'image',
		'color_text'
	];
}
