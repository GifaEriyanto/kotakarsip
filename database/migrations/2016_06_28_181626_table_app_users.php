<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TableAppUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('app_users', function(Blueprint $table) {
            $table->integer('id');
            $table->string('user_login', 60);
            $table->string('user_pass', 60);
            $table->string('user_displayname', 100);
            $table->string('user_email', 100);
            $table->timestamp('user_registered');
            $table->enum('user_activation', ['0','1']);
            $table->enum('user_status', ['0','1']);
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
