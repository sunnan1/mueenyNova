<?php

namespace App\Nova;

use App\Nova\Filters\StoreUserMembershipFilter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class MembershipNova extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\MembershipNova::class;

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
        'name_en','name_ar',
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
                ->store(function (Request $request, \App\Models\MembershipNova $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads/memberships', 'public')];
                })
                ->disableDownload(),
            Text::make('Name English' , 'name_en')
                ->rules('required', 'min:1')
                ->creationRules('unique:membership_novas,name_en')
                ->updateRules('unique:membership_novas,name_en,{{resourceId}}'),
            Text::make('Name Arabic' , 'name_ar')
                ->rules('required', 'min:1')
                ->creationRules('unique:membership_novas,name_ar')
                ->updateRules('unique:membership_novas,name_ar,{{resourceId}}'),
            Boolean::make('Active' , "is_active")
                ->trueValue(1)
                ->falseValue(0),
            Boolean::make('Default' , "default")
                ->trueValue(1)
                ->falseValue(0),
            Number::make('Points to achieve' , 'points')
                ->rules('required', 'numeric'),
            Text::make('Amount to gain' , 'amount')
                ->rules('required', 'numeric'),
            Select::make('Membership Type' , 'membership_type')->options([
                'admins' => 'Admins',
                'stores' => 'Stores'
            ])->rules('required'),
            Text::make('Commission percentage' , 'commission_percentage')->rules('required'),
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
        return 'Memberships';
    }
}
