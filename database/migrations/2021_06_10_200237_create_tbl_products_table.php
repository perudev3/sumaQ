<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_products', function (Blueprint $table) {
            $table->increments('products_id');
            $table->string('products_name')->nullable();
            $table->integer('collections_id')->unsigned();
            $table->integer('categories_id')->unsigned();
            $table->integer('materials_id')->unsigned();
            $table->longText('products_caracts')->nullable();
            $table->float('products_price')->nullable();
            $table->float('products_net_price')->nullable();
            $table->string('products_image_url')->nullable();
            $table->integer('discounts_id')->nullable();
            $table->integer('products_is_active')->nullable();
            $table->timestamps();

            $table->foreign('collections_id')->references('collections_id')->on('mae_collections');
            $table->foreign('categories_id')->references('categories_id')->on('mae_categories');
            $table->foreign('materials_id')->references('materials_id')->on('mae_materials');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_products');
    }
}
