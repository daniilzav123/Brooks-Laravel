<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class TaskReminder extends Model {

    protected $table = 'TaskReminder';
    protected $fillable = array('field');
}
