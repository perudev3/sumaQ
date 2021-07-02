<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblGroupDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_group_discounts', function (Blueprint $table) {
            $table->increments('group_discounts_id');
            $table->longText('group_discounts_name')->nullable();
            $table->integer('discounts_id')->unsigned();
            $table->integer('products_id')->unsigned();
            $table->integer('categories_id')->unsigned();
            $table->integer('collections_id')->unsigned();
            $table->timestamps();

            $table->foreign('discounts_id')->references('discounts_id')->on('mae_discounts');
            $table->foreign('products_id')->references('products_id')->on('tbl_products');
            $table->foreign('categories_id')->references('categories_id')->on('mae_categories');
            $table->foreign('collections_id')->references('collections_id')->on('mae_collections');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_group_discounts');
    }
}
