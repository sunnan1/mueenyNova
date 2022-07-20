<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableRemoveIndexes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('advertisements' , function (Blueprint $table){
            $table->dropForeign('advertisements_availability_time_id_foreign');
            $table->dropForeign('advertisements_main_category_id_foreign');
            $table->dropForeign('advertisements_sub_category_id_foreign');
            $table->dropForeign('advertisements_currency_id_foreign');
            $table->dropForeign('advertisements_user_id_foreign');
        });
        Schema::table('offers' , function (Blueprint $table){
            $table->dropForeign('offers_currency_id_foreign');
            $table->dropForeign('offers_cancellation_reason_id_foreign');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
