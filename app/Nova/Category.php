<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class Category extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\Category::class;

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
        'id'
    ];

    public static $group = 'General';
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
            })->exceptOnForms(),
            Text::make('AR')->displayUsing(function(){
                foreach ($this->translations as $locale)
                {
                    if ($locale->locale === 'ar')
                    {
                        return $locale->name;
                    }
                }
            })->exceptOnForms(),
            Boolean::make('Active' , "active")
                ->trueValue(1)
                ->falseValue(0)
                ->rules('required'),
            Number::make('Positions' , 'position'),
            Number::make('Level' , 'level'),
            BelongsTo::make('Parent' , 'category' , Category::class),
            Text::make('EN Parent Category')->displayUsing(function(){
                if ($this->category)
                {
                    foreach ($this->category->translations as $cat)
                    {
                        if ($cat->locale === 'en')
                        {
                            return $cat->name;
                        }
                    }
                }
            })->exceptOnForms(),
            Text::make('AR Parent Category')->displayUsing(function(){
                if ($this->category)
                {
                    foreach ($this->category->translations as $cat)
                    {
                        if ($cat->locale === 'ar')
                        {
                            return $cat->name;
                        }
                    }
                }
            })->exceptOnForms(),
            HasMany::make('Translations' , 'translations' , CategoryTranslation::class)
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
