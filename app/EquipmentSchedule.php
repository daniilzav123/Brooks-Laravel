<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class EquipmentSchedule extends Model {

    protected $table = 'EquipmentSchedule';
    protected $fillable = array('EquipmentID', 'MaintenanceItems', 'ServicedDate', 'ServicedHours', 'NextDate', 'NextHours', 'UserID');
}
