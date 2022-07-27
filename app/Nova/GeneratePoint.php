<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class GeneratePoint extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\GeneratePoint::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'bill_id';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'user_phone_number','bill_id','duration_return'
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
            Text::make('User Phone Number' , 'user_phone_number')
                ->rules('required', 'max:255'),
            Text::make('Bill ID' , 'bill_id')
                ->rules('required', 'max:255'),
            Text::make('Amount of purchase' , 'amount')
                ->rules('required', 'max:255'),
            Number::make('Generated Points' , 'generated_points')->exceptOnForms(),
            Number::make('Duration of return in days' , 'duration_return')
                ->rules('required', 'max:255'),
            Select::make('Status' , 'status')
                ->options([
                    1 => 'Pending',
                    2 => 'Active',
                    3 => 'Returned'
                ])->onlyOnForms()
                ->rules('required'),
            Text::make('Status')->displayUsing(function() {
                if ($this->status == 1)
                {
                    return 'Pending';
                }
                if ($this->status == 2)
                {
                    return 'Active';
                }
                if ($this->status == 3)
                {
                    return 'Returned';
                }
            })->exceptOnForms(),
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
