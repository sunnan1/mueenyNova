<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use App\Policies\PermissionPolicy;
use App\Policies\Policy;
use App\Policies\RolePolicy;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        Role::class         => RolePolicy::class,
        Permission::class   => PermissionPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        Gate::guessPolicyNamesUsing(function ($modelClass) {
            $classDirname = str_replace(
                ['/', '\Models'],
                ['\\', '\Policies'],
                dirname(str_replace('\\', '/', $modelClass))
            );

            if (! str_contains($classDirname, '\Policies')) {
                $classDirname .= '\Policies';
            }

            $policyClass = $classDirname.'\\'.class_basename($modelClass).'Policy';

            if (class_exists($policyClass)) {
                return $policyClass;
            }

            return Policy::class;
        });
        $this->registerPolicies();

        //
    }
}
