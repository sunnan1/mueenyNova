<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCancellationReasonNovasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cancellation_reason_novas', function (Blueprint $table) {
            $table->id();
            $table->string('name_en')->nullable();
            $table->string('name_ar')->nullable();
            $table->tinyInteger('active');
            $table->integer('type');
            $table->integer('position');
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
        Schema::dropIfExists('cancellation_reason_novas');
    }
}
