<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class LoginInfo extends Model {

    protected $table = 'LoginInfo';

    protected $fillable = array('username', 'password');
}
