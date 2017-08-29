<?php 

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use \Serverfireteam\Panel\CrudController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\EquipmentRepair;

class EquipmentRepairController extends CrudController{

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
        $this->filter->add('UserID', 'UserID', 'text');
        $this->filter->submit('search');
        $this->filter->reset('reset');
        $this->filter->build();

        $this->grid = \DataGrid::source($this->filter);
        $this->grid->add('EquipmentID', 'EquipmentID');
        $this->grid->add('Date', 'Date');
        $this->grid->add('Hours', 'Hours');
        $this->grid->add('RepairedBy', 'RepairedBy');
        $this->grid->add('RepairNotes', 'RepairNotes');
        $this->grid->add('RepairNotesPhoto', 'RepairNotesPhoto');
        $this->grid->add('RepairNeeded', 'RepairNeeded');
        $this->grid->add('UserID', 'UserID');
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
        $equiplogItem['EquipmentID'] = $request['EquipmentID'];
        $equiplogItem['Date'] = $request['Date'];
        $equiplogItem['Hours'] = $request['Hours'];
        $equiplogItem['RepairedBy'] = $request['RepairedBy'];
        $equiplogItem['RepairNotes'] = $request['RepairNotes'];
        $equiplogItem['RepairNotesPhoto'] = $request['RepairNotesPhoto'];
        $equiplogItem['RepairNeeded'] = $request['RepairNeeded'];
        $equiplogItem['UserID'] = $request['UserID'];
        $equip = EquipmentRepair::create($equiplogItem);
        return response(['response' => 'success']);
    }


    public function getEquipList(Request $request)
    {
        $jobs = DB::table('EquipmentRepair')->get();
        return response(['response' => $jobs]);
    }
    public function viewneeded(Request $request)
    {
        $jobs = DB::table('EquipmentRepair')->get();
        return response(['response' => $jobs]);
    }


    public function createneeded(Request $request)
    {
        $equiplogItem = array();
        $equiplogItem['EquipmentID'] = $request['EquipmentID'];
        $equiplogItem['Date'] = $request['Date'];
        $equiplogItem['Hours'] = $request['Hours'];
        $equiplogItem['RepairNotes'] = $request['RepairNotes'];
        $equiplogItem['RepairNotesPhoto'] = $request['RepairNotesPhoto'];
        $equiplogItem['RepairNeeded'] = $request['RepairNeeded'];
        $equiplogItem['UserID'] = $request['UserID'];
        $equip = EquipmentRepair::create($equiplogItem);
        return response(['response' => 'success']);
    }

}
