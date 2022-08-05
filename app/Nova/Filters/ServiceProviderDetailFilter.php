<?php

namespace App\Nova\Filters;

use Illuminate\Http\Request;
use Laravel\Nova\Filters\BooleanFilter;
use Laravel\Nova\Filters\Filter;

class ServiceProviderDetailFilter extends Filter
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
        if ($value === 'join') {
            return $query->latest()->where('is_submitted', 1)->pending();
        }
        if ($value === 'agency') {
            return $query->latest()->pending()->whereNotIn('nationality', ['SA'])->where('is_submitted', 0);
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
            'Join Requests' => 'join',
            'Join Request Agency' => 'agency',
        ];
    }
}
