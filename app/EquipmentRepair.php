<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class EquipmentRepair extends Model {

    protected $table = 'EquipmentRepair';
    protected $fillable = array('EquipmentID', 'Date', 'Hours', 'RepairedBy', 'RepairNotes', 'RepairNotesPhoto', 'RepairNeeded', 'UserID');
}
