<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class EquipmentRoutine extends Model {

    protected $table = 'EquipmentRoutine';
    protected $fillable = array('EquipmentID', 'MaintenanceType', 'Date', 'Hour', 'IsHighPressure', 'IsHighVolume', 'IsRemind', 'IsBed', 'IsChassis', 'RemindHours', 'UserID');

}
