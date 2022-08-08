<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class WelcomeScreenNova extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\WelcomeScreenNova::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'title_en';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'title_en',
        'title_ar',
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
                ->resolveUsing(fn ($v) => '/uploads/welcome_screens/'.$v ?: '../default.png')
                ->store(function (Request $request, \App\Models\WelcomeScreenNova $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    $image =  ['image' => $request->image->store('/uploads/welcome_screens', 'public')];
                    $extension = explode('/', $image['image']);
                    return end($extension);
                })
                ->disableDownload(),
            Text::make('Title EN' , 'title_en')
                ->rules('required', 'min:1')
                ->creationRules('unique:welcome_screen_novas,title_en')
                ->updateRules('unique:welcome_screen_novas,title_en,{{resourceId}}'),
            Text::make('Title AR' , 'title_ar')
                ->rules('required', 'min:1')
                ->creationRules('unique:welcome_screen_novas,title_ar')
                ->updateRules('unique:welcome_screen_novas,title_ar,{{resourceId}}'),
            Text::make('Description EN' , 'description_en')
                ->onlyOnForms()
                ->rules('required', 'min:1'),
            Text::make('Description AR' , 'description_ar')
                ->onlyOnForms()
                ->rules('required', 'min:1'),
            Boolean::make('Active' , "active")
                ->trueValue(1)
                ->falseValue(0)
                ->rules('required'),
            Number::make('Position' , 'position')->rules('required'),
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
        return 'Welcome Screens';
    }
}
