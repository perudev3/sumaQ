<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblCustomerUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_customer_users', function (Blueprint $table) {
            $table->increments('customer_users_id');
            $table->string('identification_document')->nullable();
            $table->string('movil')->nullable();
            $table->string('address')->nullable();
            $table->string('area')->nullable();
            $table->integer('id')->unsigned();
            $table->timestamps();

            $table->foreign('id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_customer_users');
    }
}
