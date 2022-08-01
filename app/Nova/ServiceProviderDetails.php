<?php

namespace App\Nova;

use App\Nova\Filters\ServiceProviderDetailFilter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Date;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\HasManyThrough;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class ServiceProviderDetails extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Models\ServiceProviderDetails::class;

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
        'name',
        'email',
        'mobile',
        'nationality',
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
            Avatar::make('Image', 'image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '../default.png')
                ->store(function (Request $request, \App\Models\ServiceProviderDetails $model) {
                    if ($model->image) {
                        Storage::disk('public')->delete($model->image);
                    }
                    return ['image' => $request->image->store('/uploads', 'public')];
                })
                ->exceptOnForms()
                ->disableDownload(),
            Avatar::make('ID Image', 'id_image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '../default.png')
                ->store(function (Request $request, \App\Models\ServiceProviderDetails $model) {
                    if ($model->id_image) {
                        Storage::disk('public')->delete($model->id_image);
                    }
                    return ['image' => $request->id_image->store('/uploads', 'public')];
                })
                ->exceptOnForms()
                ->disableDownload(),


            Select::make('Status' , 'status')->options([
                0 => 'Pending',
                1 => 'Accepted',
                2 => 'Rejected'
            ])->onlyOnForms(),
            Text::make('Status' , 'status')->displayUsing(function (){
                if ($this->status == 0)
                {
                    return 'Pending';
                }
                if ($this->status == 1)
                {
                    return 'Accepted';
                }
                if ($this->status == 2)
                {
                    return 'Rejected';
                }
            })->exceptOnForms(),
            Text::make('Name' , 'name'),
            Text::make('Email' , 'email'),
            Text::make('Mobile' , 'mobile'),
            Text::make('Type' , 'type')->displayUsing(function (){
                return $this->type == 1 ? 'Individual' : ($this->type == 2 ? 'Company' : '');
            })->exceptOnForms(),
            Text::make('Description' , 'description')->onlyOnDetail(),
            Text::make('Nationality' , 'nationality'),
            Date::make('Date of Birth' , 'user.dob'),
            Text::make('Commercial Record' , 'commercial_record'),
            Select::make('Type' , 'type')->options([
                1 => 'Individual',
                2 => 'Company'
            ])->onlyOnForms(),
            Avatar::make('Commercial Record Image', 'commercial_record_image')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '../default.png')
                ->store(function (Request $request, \App\Models\ServiceProviderDetails $model) {
                    if ($model->commercial_record_image) {
                        Storage::disk('public')->delete($model->commercial_record_image);
                    }
                    return ['commercial_record_image' => $request->commercial_record_image->store('/uploads/service_providers', 'public')];
                })
                ->exceptOnForms()
                ->disableDownload(),

            Avatar::make('ID Proof', 'id_proof')
                ->disk('public')
                ->resolveUsing(fn ($v) => $v ?: '../default.png')
                ->store(function (Request $request, \App\Models\ServiceProviderDetails $model) {
                    if ($model->id_proof) {
                        Storage::disk('public')->delete($model->id_proof);
                    }
                    return ['id_proof' => $request->id_proof->store('/uploads/service_providers', 'public')];
                })
                ->exceptOnForms()
                ->disableDownload(),
            BelongsTo::make('User' , 'user' , User::class),
            BelongsTo::make('Agency' , 'agency' , Admin::class),
            BelongsTo::make('Operated By' , 'admin' , Admin::class),
            Text::make('Bank Account')->displayUsing(function(){
               return $this->user->bankAccounts()->count();
            })->onlyOnDetail(),
            Text::make('Locations')->displayUsing(function() {
                $address = [];
                foreach($this->user->address as $add)
                {
                    $address[] = $add->description;
                }
                return implode(', ', $address);
            })->onlyOnDetail(),
            Text::make('Balance' , 'balance'),
            Boolean::make('Block' , 'block')
                ->trueValue(1)
                ->falseValue(0),
            Boolean::make('Allowed to Offer' , 'allowed_to_offer')
                ->trueValue(1)
                ->falseValue(0),
            HasMany::make('Documents' , 'documents' , ServiceProviderDetailDocuments::class),
        ];

        return $columns;
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
            new ServiceProviderDetailFilter(),
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
        return 'Service Provider';
    }
}
