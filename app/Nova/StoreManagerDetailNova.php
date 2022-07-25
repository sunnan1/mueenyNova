<?php

namespace App\Nova;

use App\Nova\Filters\StoreUserMembershipFilter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\Date;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class StoreManagerDetailNova extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\StoreManagerDetailNova::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'name';

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
            Avatar::make('Cover Image', 'cover_image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '')
                ->store(function (Request $request, \App\Models\StoreManagerDetailNova $model) {
                    if ($model->cover_image) {
                        Storage::disk('public')->delete($model->cover_image);
                    }
                    return ['cover_image' => $request->cover_image->store('/uploads/admins', 'public')];
                })
                ->disableDownload(),
            Avatar::make('Image', 'image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '')
                ->store(function (Request $request, \App\Models\StoreManagerDetailNova $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads', 'public')];
                })
                ->disableDownload(),
            Text::make('Name' , 'name'),
            Text::make('Description' , 'description'),
            Date::make('Date of Joining' , 'doj'),
            BelongsTo::make('Category' , 'category' , CategoryNova::class),
            BelongsTo::make('Country' , 'country' , LocationNova::class),
            BelongsTo::make('City' , 'city' , LocationNova::class),
            BelongsTo::make('Region' , 'region' , LocationNova::class),
            BelongsTo::make('Membership' , 'membership' , MembershipNova::class),
            BelongsTo::make('Admin' , 'admin' , Admin::class),
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
        return [
            new StoreUserMembershipFilter()
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

    public static function label()
    {
        return 'Store Manager Details';
    }
}
