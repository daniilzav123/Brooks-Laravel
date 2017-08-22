<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class JobInfo extends Model {

    protected $table = 'JobInfo';
    protected $fillable = array('User', 'Date', 'Grower', 'FarmName', 'FieldName', 'AppType', 'EquipID', 'Acres', 'note', 'imageUrl');
}
