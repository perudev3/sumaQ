<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblLayawayDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_layaway_details', function (Blueprint $table) {
            $table->increments('layaway_details_id');
            $table->integer('layaway_id')->unsigned();
            $table->integer('customers_id')->unsigned();
            $table->integer('products_id')->unsigned();
            $table->integer('sucursals_id')->nullable();
            $table->timestamps();

            $table->foreign('layaway_id')->references('layaway_id')->on('tbl_layaway');
            $table->foreign('customers_id')->references('customers_id')->on('tbl_customers');
            $table->foreign('products_id')->references('products_id')->on('tbl_products');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_layaway_details');
    }
}
