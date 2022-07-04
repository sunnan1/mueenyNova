<?php

namespace App\Nova\Filters;

use Illuminate\Http\Request;
use Laravel\Nova\Filters\BooleanFilter;
use Laravel\Nova\Filters\Filter;

class LanguageFilter extends BooleanFilter
{
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
        if ($value['en'])
        {
            $query->whereHas('translations' , function ($q){
                $q->where('locale' , 'en');
            });
        }
        if ($value['ar'])
        {
            $query->whereHas('translations' , function ($q){
                $q->where('locale' , 'ar');
            });
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
            'English' => 'en',
            'Arabic' => 'ar',
        ];
    }
}
