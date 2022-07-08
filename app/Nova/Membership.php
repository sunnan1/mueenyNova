<?php

namespace App\Nova;

use App\Nova\Filters\StoreUserMembershipFilter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class Membership extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\Membership::class;

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
            Avatar::make('Membership', 'image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '')
                ->store(function (Request $request, \App\Models\Membership $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads', 'public')];
                })
                ->disableDownload(),

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
            Boolean::make('Active' , "is_active")
                ->trueValue(1)
                ->falseValue(0),
            Select::make('Membership Type' , 'membership_type')
                ->options([
                    'stores' => 'Stores',
                    'admins' => 'Admins',
                ]),
            Number::make('Points' , 'points')->default(0),
            Number::make('Amount' , 'amount')->default(0),
            Number::make('Commission Percentage' , 'commission_percentage')->default(0),
            Boolean::make('Default' , "default")
                ->trueValue(1)
                ->falseValue(0),
            HasMany::make('Membership Translations' , 'translations' , MembershipTranslation::class),

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
}
