<?php

namespace App\Policies;

use App\Models\Admin;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;
use Illuminate\Support\Str;

class Policy
{
    use HandlesAuthorization;

    /**
     * The Permission key that Policy corresponds to.
     */
    protected ?string $modelKey = null;

    public function __construct()
    {
        if (null === $this->modelKey) {
            $modelClass = static::class;

            $modelClass = str_replace(['App\\', 'Policies\\', 'Policy'], ['', '', ''], $modelClass);

            $nestedNameSpaces = explode('\\', $modelClass);

            $modelClass = array_pop($nestedNameSpaces);

            $modelClass = Str::plural(Str::snake($modelClass, '-'));

            if (count($nestedNameSpaces)) {
                $prefix = Str::snake(implode(' ', $nestedNameSpaces), '-');
                $modelClass = $prefix.' '.$modelClass;
            }

            $this->modelKey = $modelClass;
        }
    }

    /**
     * @param Admin $admin
     * @return Response|bool
     */
    public function viewAny(Admin $admin): Response|bool
    {
        return $admin->can('list '.$this->modelKey);
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param Admin $admin
     * @return Response|bool
     */
    public function view(Admin $admin): Response|bool
    {
        return $admin->can('view '.$this->modelKey);
    }

    /**
     * @param Admin $admin
     * Determine whether the user can create models.
     *
     * @return Response|bool
     */
    public function create(Admin $admin): Response|bool
    {
        return $admin->can('create '.$this->modelKey);
    }

    /**
     * @param Admin $admin
     * Determine whether the user can update the model.
     *
     * @return Response|bool
     */
    public function update(Admin $admin): Response|bool
    {
        return $admin->can('update '.$this->modelKey);
    }

    /**
     * @param Admin $admin
     * Determine whether the user can delete the model.
     *
     * @return Response|bool
     */
    public function delete(Admin $admin): Response|bool
    {
        return $admin->can('delete '.$this->modelKey);
    }

    /**
     * @param Admin $admin
     * Determine whether the user can restore the model.
     *
     * @return Response|bool
     */
    public function restore(Admin $admin): Response|bool
    {
        return $admin->can('restore '.$this->modelKey);
    }

    /**
     * @param Admin $admin
     * Determine whether the user can permanently delete the model.
     *
     * @return Response|bool
     */
    public function forceDelete(Admin $admin): Response|bool
    {
        return $admin->can('forceDelete '.$this->modelKey);
    }
}
