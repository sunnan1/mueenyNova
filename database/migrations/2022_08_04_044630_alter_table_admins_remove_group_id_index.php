<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableAdminsRemoveGroupIdIndex extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('admins' , function (Blueprint $table){
            $table->dropForeign('admins_group_id_foreign');
        });
        Schema::table('advertisement_cancellation' , function (Blueprint $table){
            $table->dropForeign('advertisement_cancellation_cancellation_reason_id_foreign');
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
