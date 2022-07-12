<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Date;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Password;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class User extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\User::class;

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
        'id', 'name' ,'email' , 'mobile'
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
                ->resolveUsing(fn ($v) => $v ?: '')
                ->store(function (Request $request, \App\Models\User $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads', 'public')];
                })
                ->disableDownload(),

            Text::make('Name')
                ->sortable()
                ->rules('required', 'max:255'),

            Text::make('Email')
                ->sortable()
                ->rules('required', 'email', 'max:254')
                ->creationRules('unique:users,email')
                ->updateRules('unique:users,email,{{resourceId}}'),

            Text::make('Mobile' , 'mobile'),

            Text::make('Bio' , 'bio'),

            Date::make('DOB' , 'dob'),

            Text::make('Gender' , 'gender')->exceptOnForms(),

            Boolean::make('Service Provider' , "is_service_provider")
                ->trueValue(1)
                ->falseValue(0),

            Boolean::make('Order offers notification' , "orders_offers_notifications")
                ->trueValue(1)
                ->falseValue(0),

            Boolean::make('Message Notifications' , "messages_notifications")
                ->trueValue(1)
                ->falseValue(0),


            Boolean::make('Appointment Notifications' , "appointments_notifications")
                ->trueValue(1)
                ->falseValue(0),

            BelongsTo::make('Language' , 'language' , Language::class),

            Boolean::make('Active' , "active")
                ->trueValue(1)
                ->falseValue(0),

            Number::make('Cancelled Orders' , "cancelled_orders_count")->exceptOnForms(),

            Boolean::make('Post Allowed' , "allowed_to_post")
                ->trueValue(1)
                ->falseValue(0),

            Boolean::make('Store' , "is_store")
                ->trueValue(1)
                ->falseValue(0),

            BelongsTo::make('Memberships' , 'membership', Membership::class)
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
