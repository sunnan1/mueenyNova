<?php

namespace App\Nova\Filters;

use Illuminate\Http\Request;
use Laravel\Nova\Filters\BooleanFilter;
use Laravel\Nova\Filters\Filter;

class AdvertisementFilter extends Filter
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
        if ($value === 'operation') {
            return $query->latest();
        }
        if ($value === 'active') {
            $query->active();
        }
        if ($value === 'past') {
            $query->past();
        }
        if ($value === 'invoice') {
            $query->completed();
        }
        if ($value == 'commission') {
            $query->active();
        }
        return $query->latest();
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
            'Active Orders' => 'active',
            'Past Orders' => 'past',
            'Invoices' => 'invoice',
            'Commission Details' => 'commission',
            'Operation Records' => 'operation',
        ];
    }
}
