<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class EquipmentLog extends Model {

    protected $table = 'EquipmentLog';
    protected $fillable = array('jobID', 'Date', 'Hour');
}
