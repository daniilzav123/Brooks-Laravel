<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;

class PingContent extends Model {

    protected $table = 'pingcontent';

    protected $fillable = array('trace_id',
                                'no',
                                'ping_ip',
                                'location_of_ip',
                                'service_of_ip',
                                'ping_delay');
}
