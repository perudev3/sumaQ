<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblSolicitudesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_solicitudes', function (Blueprint $table) {
            $table->increments('solicitudes_id');
            $table->date('solictudes_fecha')->nullable();
            $table->integer('solicitudes_from')->nullable();
            $table->integer('sucursals_id')->nullable();
            $table->longText('solicitudes_subject')->nullable();
            $table->longText('solicitudes_message')->nullable();
            $table->integer('cantidad')->nullable();
            $table->integer('products_id')->unsigned();
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
        Schema::dropIfExists('tbl_solicitudes');
    }
}
