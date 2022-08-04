<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableRemoveUserLanguageEfficiencyForeign extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_language' , function (Blueprint $table){
            $table->dropForeign('user_language_language_id_foreign');
            $table->dropForeign('user_language_efficiency_level_id_foreign');
        });

        Schema::table('practical_experiences' , function (Blueprint $table){
            $table->dropForeign('practical_experiences_efficiency_level_id_foreign');
        });

        Schema::table('services' , function (Blueprint $table){
            $table->dropForeign('services_main_category_id_foreign');
            $table->dropForeign('services_sub_category_id_foreign');
            $table->dropForeign('services_efficiency_level_id_foreign');
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
