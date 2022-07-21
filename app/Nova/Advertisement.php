<?php

namespace App\Nova;

use App\Nova\Filters\AdvertisementFilter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Date;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Image;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class Advertisement extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\Advertisement::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'title';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'title', 'description'
    ];

    /**
     * Get the fields displayed by the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function fields(Request $request)
    {
        $columns =  [
            ID::make(__('ID'), 'id')->sortable(),
            Text::make('Full Name')->displayUsing(function (){
                return $this->user->name;
            })->exceptOnForms(),
            Text::make('Email')->displayUsing(function (){
                return $this->user->email;
            })->exceptOnForms(),
            Image::make('Profile Photo')->disk('public')->exceptOnForms(),
            Text::make('Title' , 'title')->exceptOnForms(),
            Text::make('Description' , 'description')->exceptOnForms(),
            Select::make('Type' , 'type')->options([
                1 => 'In Location',
                2 => 'Remotely'
            ])->onlyOnForms(),
            Select::make('Payment Status' , 'payment_status')->options([
                0 => 'Pending',
                1 => 'Paid'
            ])->onlyOnForms(),
            Select::make('Status' , 'status')->options([
                0 => 'Waiting for acceptance',
                1 => 'Active',
                2 => 'Completed',
                3 => 'Cancelled',
                4 => 'Refunded',
            ])->onlyOnForms(),
            Text::make('Type' , 'type')->displayUsing(function (){
                return $this->type == 1 ? 'In Location' : ($this->type == 2 ? 'Remotely' : '');
            })->exceptOnForms(),
            Date::make('Date' , 'date'),
            Text::make('Budget' , 'budget'),
            Text::make('Commission' , 'commission'),
            Text::make('Payment Status' , 'payment_status')->displayUsing(function (){
                return $this->type == 0 ? 'Pending' : ($this->type == 1 ? 'Paid' : '');
            })->exceptOnForms(),
            BelongsTo::make('User' , 'user' , User::class)->exceptOnForms(),
            BelongsTo::make('Payment Method' , 'paymentMethodNova' , PaymentMethodNova::class)->exceptOnForms(),
            BelongsTo::make('Main Category' , 'categoryNova' , CategoryNova::class)->exceptOnForms(),
            BelongsTo::make('Sub Category' , 'subCategoryNova' , CategoryNova::class)->exceptOnForms(),
            HasMany::make('Offers', 'offers' , Offer::class),
            Text::make('Status' , 'status')->displayUsing(function (){
                if ($this->status == 0)
                {
                    return 'Waiting for acceptance';
                }
                if ($this->status == 1)
                {
                    return 'Active';
                }
                if ($this->status == 2)
                {
                    return 'Completed';
                }
                if ($this->status == 3)
                {
                    return 'Cancelled';
                }
                if ($this->status == 4)
                {
                    return 'Refunded';
                }
            })->exceptOnForms(),
            Text::make('Invoice Number' , 'invoice_number')->exceptOnForms(),
            ];
            $additional = [];
            if ($this->status === 2)
            {
                $additional = [
                    Text::make('Invoices')->displayUsing(function(){
                        return '<a target="_blank" href="' . env('APP_URL') . '/orders_management/pdf/' . $this->id . '/C">Client Invoice</a> &nbsp;&nbsp;&nbsp; <a target="_blank" href="' . env('APP_URL') . '/orders_management/pdf/' . $this->id . '/S">SP Invoice</a>';
                    })->asHtml(),
                ];
            }
            return array_merge($columns , $additional);
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
        return [
            new AdvertisementFilter(),
        ];
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
