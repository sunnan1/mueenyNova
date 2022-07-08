<?php

namespace App\Nova\Filters;

use Illuminate\Http\Request;
use Laravel\Nova\Filters\BooleanFilter;
use Laravel\Nova\Filters\Filter;

class StoreUserMembershipFilter extends BooleanFilter
{
    /**
     * The filter's component.
     *
     * @var string
     */

    /**
     * Apply the filter to the given query.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  mixed  $value
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function apply(Request $request, $query, $value)
    {
        foreach($value as $key => $v)
        {
            if ($key == 'stores') {
                if ($v) {
                    $query->where('membership_type' , '=','stores');
                }
            } if ($key == 'admins') {
                if ($v) {
                    $query->orWhere('membership_type' , '=','admins');
                }
            }
        }
        return $query;
    }

    /**
     * Get the filter's available options.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function options(Request $request)
    {
        return [
            'Store Membership' => 'stores',
            'Admin Membership' => 'admins',
        ];
    }
}
