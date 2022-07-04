<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class SupportTicket extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\SupportTicket::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'id';

    public static $group = 'General';
    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'id',
    ];

    public static $with = ['supportReason', 'user'];

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
            Text::make('Name' , 'name'),
            Text::make('Message' , 'message'),
            Text::make('Status')->displayUsing(function (){
                if ($this->status == 0)
                {
                    return  'Open';
                }
                if ($this->status == 1)
                {
                    return  'Pending';
                }
                if ($this->status == 2)
                {
                    return  'Closed';
                }
            }),
            Text::make('EN')->displayUsing(function(){
                foreach ($this->supportReason->translations as $locale)
                {
                    if ($locale->locale === 'en')
                    {
                        return $locale->name;
                    }
                }
            })->onlyOnIndex(),
            Text::make('AR')->displayUsing(function(){
                foreach ($this->supportReason->translations as $locale)
                {
                    if ($locale->locale === 'ar')
                    {
                        return $locale->name;
                    }
                }
            })->onlyOnIndex(),
            Select::make('Status' , 'status')->options([
                'Open' => 0,
                'Pending' => 1,
                'Closed' => 2
            ]),
            BelongsTo::make('Support Reason' , 'supportReason' , SupportReason::class)->onlyOnForms(),
            BelongsTo::make('User' , 'user' , User::class),
            Text::make('User Name')->displayUsing(function(){
                return $this->user->name;
            })->onlyOnIndex(),
            Text::make('Mobile')->displayUsing(function(){
                return $this->user->mobile;
            })->onlyOnIndex(),
            Text::make('Email')->displayUsing(function(){
                return $this->user->email;
            })->onlyOnIndex(),
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
