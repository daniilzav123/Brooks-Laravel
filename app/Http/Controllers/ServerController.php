<?php 

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Serverfireteam\Panel\CrudController;
use Illuminate\Support\Facades\DB;
use App\Server;

class ServerController extends Controller{

    public function all($entity) {
        $crud = new CrudController(new \Lang());
        $crud->all($entity);

        $crud->filter = \DataFilter::source(new \App\Server());

        $crud->grid = \DataGrid::source($crud->filter);
        $crud->grid->add('server', 'Server');
        $crud->grid->add('created_at', 'Created At');
        $crud->grid->add('updated_at', 'Updated At');
        $crud->addStylesToGrid('id', 20);

        $view = \View::make('panelViews::all', array(
            'grid'           => $crud->grid,
            'filter'         => $crud->filter,
            'title'          => $crud->entity,
            'current_entity' => $crud->entity,
            'import_message' => (\Session::has('import_message')) ? \Session::get('import_message') : ''
        ));

        return $view;
    }

    public function  edit($entity) {
        $crud = new CrudController(new \Lang());

        $crud->edit($entity);

        $crud->edit = \DataEdit::source(new \App\Server());

        $crud->edit->label('Edit Server Address');
        $crud->edit->add('server', 'Server', 'text');

        return $crud->returnEditView();
    }

    public function store(Request $request)
    {
        //$server = Server::all()[0]['server'];
        //return response($server);
        return $request['data'];
    }
}