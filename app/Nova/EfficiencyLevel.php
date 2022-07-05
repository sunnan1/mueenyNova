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

class EfficiencyLevel extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\EfficiencyLevel::class;

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
            Select::make('Active' , 'status')
                ->options([
                    '1' => 'Active',
                    '0' => 'Not Active',
                ])
                ->onlyOnForms()
                ->rules('required'),
            Boolean::make('Active' , "status")
                ->trueValue(1)
                ->falseValue(0)
                ->onlyOnDetail(),

            Boolean::make('Active' , "status")
                ->trueValue(1)
                ->falseValue(0)
                ->onlyOnIndex(),
            Number::make('Positions' , 'position'),
            HasMany::make('Efficiency Level Translation' , 'translations' , EfficiencyLevelTranslation::class),
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
