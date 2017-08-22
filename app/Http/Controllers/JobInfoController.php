<?php 

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use \Serverfireteam\Panel\CrudController;
use App\JobInfo;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class JobInfoController extends CrudController{

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
                 
        $this->filter = \DataFilter::source(new \App\JobInfo);
        $this->filter->add('Date', 'Date', 'text');
        $this->filter->submit('search');
        $this->filter->reset('reset');
        $this->filter->build();

        $this->grid = \DataGrid::source($this->filter);
        $this->grid->add('User', 'User');
        $this->grid->add('Date', 'Date');
        $this->grid->add('Grower', 'Grower');
        $this->grid->add('FarmName', 'FarmName');
        $this->grid->add('FieldName', 'FieldName');
        $this->grid->add('AppType', 'AppType');
        $this->grid->add('EquipID', 'EquipID');
        $this->grid->add('Acres', 'Acres');
        $this->grid->add('note', 'note');
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
        $jobinfoItem = array();
        $jobinfoItem['User'] = $request['User'];
        $jobinfoItem['Date'] = $request['Date'];
        $jobinfoItem['Grower'] = $request['Grower'];
        $jobinfoItem['FarmName'] = $request['FarmName'];
        $jobinfoItem['FieldName'] = $request['FieldName'];
        $jobinfoItem['AppType'] = $request['AppType'];
        $jobinfoItem['EquipID'] = $request['EquipID'];
        $jobinfoItem['Acres'] = $request['Acres'];
        $jobinfoItem['note'] = $request['note'];
        $jobinfoItem['imageUrl'] = $request['imageUrl'];
        $jobinfo = JobInfo::create($jobinfoItem);
        return response(['response' => 'success']);
    }

    public function getJobList(Request $request)
    {
        $jobs = DB::table('JobInfo')->get();
        return response(['response' => $jobs]);
    }
}
