<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMembershipNovasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('membership_novas', function (Blueprint $table) {
            $table->id();
            $table->string('name_en')->nullable();
            $table->string('name_ar')->nullable();
            $table->tinyInteger('is_active');
            $table->integer('points');
            $table->decimal('amount');
            $table->string('image')->nullable();
            $table->enum('membership_type' , ['admins' , 'stores'])->default('admins');
            $table->decimal('commission_percentage');
            $table->tinyInteger('default');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('membership_novas');
    }
}
