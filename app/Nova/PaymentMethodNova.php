<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class PaymentMethodNova extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\PaymentMethodNova::class;

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
        'name_en',
        'name_ar',
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
            Text::make('Name EN' , 'name_en')
                ->rules('required', 'min:1')
                ->creationRules('unique:payment_method_novas,name_en')
                ->updateRules('unique:payment_method_novas,name_en,{{resourceId}}'),
            Text::make('Name AR' , 'name_ar')
                ->rules('required', 'min:1')
                ->creationRules('unique:payment_method_novas,name_ar')
                ->updateRules('unique:payment_method_novas,name_ar,{{resourceId}}'),
            Select::make('Status' , 'status')->options([
                0 => 'Active',
                1 => 'Not Active'
            ])->onlyOnForms(),
            Text::make('Status' , 'status')->displayUsing(function (){
               if ($this->status == 0){
                    return 'Active';
               } elseif ($this->status == 1){
                    return 'Not Active';
                }
            })->exceptOnForms(),
            Select::make('Type' , 'type')->options([
                'online' => 'Online',
                'offline' => 'Offline'
            ])
                ->rules('required'),
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
        return 'Payment Methods';
    }
}
