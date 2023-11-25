<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id
 * @property string $name
 * @property string $email
 * @property Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $remember_token
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property PasswordReset $password_reset
 * @property Profile $profile
 * @property Collection|QDbKOverall[] $q_db_k_overalls
 * @property Collection|QDbPk[] $q_db_pks
 * @property Collection|QDbRadical[] $q_db_radicals
 * @property Collection|QDbSolvent[] $q_db_solvents
 * @property Collection|Role[] $roles
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'users';

	protected $casts = [
		'email_verified_at' => 'datetime'
	];

	protected $hidden = [
		'password',
		'remember_token'
	];

	protected $fillable = [
		'name',
		'email',
		'email_verified_at',
		'password',
		'remember_token'
	];

	public function password_reset()
	{
		return $this->hasOne(PasswordReset::class, 'email', 'email');
	}

	public function profile()
	{
		return $this->hasOne(Profile::class, 'Usuario');
	}

	public function q_db_k_overalls()
	{
		return $this->hasMany(QDbKOverall::class, 'ID_Alta');
	}

	public function q_db_pks()
	{
		return $this->hasMany(QDbPk::class, 'ID_Alta');
	}

	public function q_db_radicals()
	{
		return $this->hasMany(QDbRadical::class, 'ID_Alta');
	}

	public function q_db_solvents()
	{
		return $this->hasMany(QDbSolvent::class, 'ID_Alta');
	}

	public function roles()
	{
		return $this->belongsToMany(Role::class)
					->withPivot('id')
					->withTimestamps();
	}
}
