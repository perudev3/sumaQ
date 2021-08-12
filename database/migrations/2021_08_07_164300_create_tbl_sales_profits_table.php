<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblSalesProfitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_sales_profits', function (Blueprint $table) {
            $table->increments('sales_profits_id');
            $table->integer('sales_id')->unsigned();
            $table->decimal('total_bussines', 10,2)->nullable();
            $table->timestamps();

            $table->foreign('sales_id')->references('sales_id')->on('tbl_sales');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_sales_profits');
    }
}
