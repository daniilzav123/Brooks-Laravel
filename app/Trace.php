<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trace extends Model {

    protected $table = 'trace';

    protected $fillable = array('phone_number',
                                'wifi',
                                'local_ip',
                                'public_ip',
                                'location_of_ip',
                                'service_of_ip',
                                'location_of_check',
                                'service_of_check',
                                'isTable3Item',
                                'isTable4Item',
                                'description');
}
