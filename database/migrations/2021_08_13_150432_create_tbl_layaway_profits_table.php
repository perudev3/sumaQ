<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblLayawayProfitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_layaway_profits', function (Blueprint $table) {
            $table->increments('layaway_profits_id');
            $table->integer('layaway_id')->unsigned();
            $table->decimal('total_bussines_layaway', 10,2)->nullable();
            $table->decimal('total_cancel_layaway', 10,2)->nullable();
            $table->timestamps();

            $table->foreign('layaway_id')->references('layaway_id')->on('tbl_layaway');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_layaway_profits');
    }
}
