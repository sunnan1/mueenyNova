<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class CategoryNova extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\CategoryNova::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'name_en';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'name_en','name_ar'
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
            Avatar::make('Image', 'image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '../default.png')
                ->store(function (Request $request, \App\Models\CategoryNova $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads', 'public')];
                })
                ->disableDownload(),
            Text::make('Name EN' , 'name_en'),
            Text::make('Name AR' , 'name_ar'),
            Select::make('Active' , 'active')
                ->options([
                    1 => 'Active',
                    0 => 'Not Active',
                ])
                ->onlyOnForms()
                ->rules('required'),

            Boolean::make('Active' , "active")
                ->trueValue(1)
                ->falseValue(0)->exceptOnForms(),

            Select::make('Partner' , 'partner')
                ->options([
                    1 => 'Yes',
                    0 => 'No',
                ])
                ->onlyOnForms(),

            Boolean::make('Partner' , "partner")
                ->trueValue(1)
                ->falseValue(0)->exceptOnForms(),

            Number::make('Position' , 'position'),
            BelongsTo::make('Category' , 'category' , CategoryNova::class)->nullable(),
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

    public static function label()
    {
        return 'Categories';
    }
}
