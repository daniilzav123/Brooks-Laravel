<?php 

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use \Serverfireteam\Panel\CrudController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\EquipmentLog;

class EquipmentLogController extends CrudController{

    public function all($entity){
        parent::all($entity); 

        /** Simple code of  filter and grid part , List of all fields here : http://laravelpanel.com/docs/master/crud-fields


			$this->filter = \DataFilter::source(new \App\Category);
			$this->filter->add('name', 'Name', 'text');
			$this->filter->submit('search');
			$this->filter->reset('reset');
			$this->filter->build();

			$this->grid = \DataGrid::source($this->filter);
			$this->grid->add('name', 'Name');
			$this->grid->add('code', 'Code');
			$this->addStylesToGrid();

        */

        $this->filter = \DataFilter::source(new \App\EquipmentLog);
        $this->filter->add('jobID', 'jobID', 'text');
        $this->filter->submit('search');
        $this->filter->reset('reset');
        $this->filter->build();

        $this->grid = \DataGrid::source($this->filter);
        $this->grid->add('jobID', 'jobID');
        $this->grid->add('UserID', 'UserID');
        $this->grid->add('Date', 'Date');
        $this->grid->add('Hour', 'Hour');
        $this->grid->add('created_at', 'Created At');
        $this->grid->add('updated_at', 'Updated At');
        $this->addStylesToGrid();

        return $this->returnView();

    }
    
    public function  edit($entity){
        
        parent::edit($entity);

        /* Simple code of  edit part , List of all fields here : http://laravelpanel.com/docs/master/crud-fields
	
			$this->edit = \DataEdit::source(new \App\Category());

			$this->edit->label('Edit Category');

			$this->edit->add('name', 'Name', 'text');
		
			$this->edit->add('code', 'Code', 'text')->rule('required');


        */
       
        return $this->returnEditView();
    }

    public function store(Request $request)
    {
        $equiplogItem = array();
        $equiplogItem['jobID'] = $request['EquipmentID'];
        $equiplogItem['Date'] = $request['date'];
        $equiplogItem['Hour'] = $request['hour'];
        $equiplogItem['UserID'] = $request['UserID'];
        $equip = EquipmentLog::create($equiplogItem);
        return response(['response' => 'success']);
    }

    public function getEquipList(Request $request)
    {
        $jobs = DB::table('EquipmentLog')->get();
        return response(['response' => $jobs]);
    }

    public function getEquipLogHistory(Request $request)
    {
        $jobs = DB::table('EquipmentLog')->get();
        return response(['response' => $jobs]);
    }

}
