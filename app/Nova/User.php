<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Date;
use Laravel\Nova\Fields\Gravatar;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Password;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Vyuldashev\NovaPermission\RoleBooleanGroup;

class User extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\User::class;

    public static $group = 'General';
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
        'id', 'name', 'email', 'mobile'
    ];

    /**
     * Get the fields displayed by the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function fields(Request $request)
    {
        $codes = config('country.countries');
        $codeOptions = [];
        foreach($codes as $code)
        {
            $codeOptions[$code['code']] = $code['code'] . ' | '.$code['name'];
        }
        return [
            ID::make()->sortable(),

            Avatar::make('Image', 'image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '../default.png')
                ->store(function (Request $request, \App\Models\User $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads/users', 'public')];
                })
                ->disableDownload(),

//            Gravatar::make()->maxWidth(50),

            Text::make('Name')
                ->sortable()
                ->rules('required', 'max:255'),

            Text::make('Email')
                ->sortable()
                ->rules('required', 'email', 'max:254')
                ->creationRules('unique:users,email')
                ->updateRules('unique:users,email,{{resourceId}}'),
            Select::make('Country Code', "country_code")
                ->options($codeOptions)
                ->onlyOnForms()
                ->rules('required'),

            Text::make('Phone' , 'mobile')
                ->sortable()
                ->rules('required', 'min:7', 'max:15')
                ->creationRules('unique:users,mobile')
                ->updateRules('unique:users,mobile,{{resourceId}}'),

            Text::make('Bio')
                ->sortable(),

            Date::make('Date of Birth' , 'dob'),
            Text::make('Balance' , 'balance')->rules('numeric'),

            Select::make('Gender', "gender")
                ->options([
                    1 => 'Male',
                    2 => 'Female'
                ])->onlyOnForms(),
            Text::make('Gender' , 'gender')->exceptOnForms(),

            Boolean::make('Active' , "active")
                    ->trueValue(1)
                    ->falseValue(0),
            Boolean::make('Allowed to Post' , "allowed_to_post")
                ->trueValue(1)
                ->falseValue(0),
            Boolean::make('Is Service Provider' , "is_service_provider")
                ->trueValue(1)
                ->falseValue(0)->exceptOnForms(),
            Boolean::make('Is Store' , "is_store")
                ->trueValue(1)
                ->falseValue(0)->exceptOnForms(),
            Password::make('Password')
                ->onlyOnForms()
                ->creationRules('required', 'string', 'min:8')
                ->updateRules('nullable', 'string', 'min:8'),
            BelongsTo::make('Mother language' , 'languageNova' , LanguageNova::class),
            BelongsTo::make('Membership' , 'membershipNova' , MembershipNova::class),
            HasMany::make('Bank Accounts' , 'bankAccounts' , BankAccount::class),
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
