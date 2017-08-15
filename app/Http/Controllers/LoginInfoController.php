<?php 

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use \Serverfireteam\Panel\CrudController;
use App\LoginInfo;

use Illuminate\Http\Request;

class LoginInfoController extends CrudController{

    public function all($entity){
        parent::all($entity); 

        /** Simple code of  filter and grid part , List of all fields here : http://laravelpanel.com/docs/master/crud-fields


			$this->filter = \DataFilter::source(new \App\Category);
			$this->filter->add('name', 'Name', 'text');
			$this->filter->submit('search');
			$this->filter->reset('reset');
			$this->filter->build();

			$this->grid = \DataGrid::source($this->filter);
			$this->grid->add('name', 'name');
			$this->grid->add('code', 'code');
			$this->addStylesToGrid();
        */
        $this->filter = \DataFilter::source(new \App\LoginInfo);
        $this->filter->add('name', 'Name', 'text');
        $this->filter->submit('search');
        $this->filter->reset('reset');
        $this->filter->build();

        $this->grid = \DataGrid::source($this->filter);
        $this->grid->add('username', 'username');
        $this->grid->add('password', 'password');
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
        $logininfoItem = array();
        $logininfoItem['username'] = $request['username'];
        $logininfoItem['password'] = $request['password'];
        $logininfo = LoginInfo::create($logininfoItem);
        return response(['response' => 'success']);
    }
}
