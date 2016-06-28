<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TableAppMasterDispotition extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_master_dispotition', function(Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('id_inbox');
            $table->string('dispotition_name', 100);
            $table->string('dispotition_position', 40);
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
