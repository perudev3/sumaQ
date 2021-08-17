<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblLayawaysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_layaway', function (Blueprint $table) {
            $table->increments('layaway_id');
            $table->integer('user_id')->unsigned();
            $table->integer('sucursals_id')->unsigned();
            $table->integer('customers_id')->unsigned();
            $table->string('layaway_payment_method')->nullable();
            $table->date('layaway_entrega_date')->nullable();
            $table->date('layaway_despacho_date')->nullable();
            $table->date('layaway_canceled_date')->nullable();
            $table->string('layaway_canceled_reason')->nullable();
            $table->date('layaway_payment_date')->nullable();
            $table->integer('layaway_status')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('sucursals_id')->references('sucursals_id')->on('mae_sucursals');
            $table->foreign('customers_id')->references('customers_id')->on('tbl_customers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_layaway');
    }
}
