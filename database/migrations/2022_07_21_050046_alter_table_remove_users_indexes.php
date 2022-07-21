<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableRemoveUsersIndexes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users' , function (Blueprint $table){
           $table->dropForeign('users_language_id_foreign');
           $table->dropForeign('users_membership_id_foreign');
        });

        Schema::table('admins' , function (Blueprint $table){
            $table->dropForeign('admins_language_id_foreign');
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
