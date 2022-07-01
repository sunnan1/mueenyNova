<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;

class CreatePermission extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'gen:perm {perm}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        foreach(['list' , 'view' ,'update' , 'create' , 'delete' , 'forceDelete'] as $perms)
        {
            $permission = new Permission();
            $permission->name = $perms.' '.$this->argument('perm');
            $permission->guard_name = 'web';
            $permission->save();
            $data = ['permission_id' => $permission->id , 'role_id' => 1];
            DB::table('role_has_permissions')->insert($data);
            $data = ['permission_id' => $permission->id , 'role_id' => 2];
            DB::table('role_has_permissions')->insert($data);
        }
        return "Done";
    }
}
