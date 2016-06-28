<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TableAppNotifications extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_notifications', function(Blueprint $table) {
            $table->bigIncrements('id');
            $table->enum('notifications_kind', ['inbox','outbox', 'master']);
            $table->enum('notifications_type', ['crate','update', 'delete']);
            $table->integer('id_user');
            $table->bigInteger('id_content');
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
