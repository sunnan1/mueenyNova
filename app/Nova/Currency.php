<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class Currency extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\Currency::class;

    public static $with = ['translations'];
    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'id';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'id',
    ];

    /**
     * Get the fields displayed by the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function fields(Request $request)
    {
        return [
            ID::make(__('ID'), 'id')->sortable(),
            Text::make('EN')->displayUsing(function(){
                foreach ($this->translations as $locale)
                {
                    if ($locale->locale === 'en')
                    {
                        return $locale->name;
                    }
                }
            })->onlyOnIndex(),
            Text::make('AR')->displayUsing(function(){
                foreach ($this->translations as $locale)
                {
                    if ($locale->locale === 'ar')
                    {
                        return $locale->name;
                    }
                }
            })->onlyOnIndex(),
            Boolean::make('Active' , "active")
                ->trueValue(1)
                ->falseValue(0)
                ->rules('required'),
            Boolean::make('Default' , "is_default")
                ->trueValue(1)
                ->falseValue(0)
                ->rules('required'),
            Number::make('Positions' , 'position'),
            Text::make('Rate' , 'rate'),
            HasMany::make('Currency Translations' , 'translations' , CurrencyTranslation::class),
        ];
    }

    /**
     * Get the cards available for the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function cards(Request $request)
    {
        return [];
    }

    /**
     * Get the filters available for the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function filters(Request $request)
    {
        return [];
    }

    /**
     * Get the lenses available for the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function lenses(Request $request)
    {
        return [];
    }

    /**
     * Get the actions available for the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function actions(Request $request)
    {
        return [];
    }
}
