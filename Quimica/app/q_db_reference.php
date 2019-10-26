<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id_reference
 * @property int $id
 * @property string $Reference
 * @property string $k_exp_ref
 * @property QDbKOverall[] $qDbKOveralls
 * @property QDbPk[] $qDbPks
 */
class q_db_reference extends Model
{
    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_reference';

    /**
     * @var array
     */
    protected $fillable = ['id', 'Reference', 'k_exp_ref'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function qDbKOveralls()
    {
        return $this->hasMany('App\QDbKOverall', 'id_reference', 'id_reference');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function qDbPks()
    {
        return $this->hasMany('App\QDbPk', 'id_reference', 'id_reference');
    }
}
