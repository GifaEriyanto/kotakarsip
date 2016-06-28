<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TableAppOutbox extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_outbox', function(Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('id_user');
            $table->integer('id_rack');
            $table->date('outbox_date');
            $table->string('inbox_for', 100);
            $table->string('inbox_number', 50);
            $table->string('inbox_title', 250);
            $table->text('inbox_desc');
            $table->text('inbox_file');
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
        //
    }
}
