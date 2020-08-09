<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCancelOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cancel_order', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('id_customer')->unsigned();
            $table->bigInteger('id_bill')->unsigned();
            $table->string('note');
            $table->string('status')->default('ready');
            $table->timestamps();
        });

        Schema::table('cancel_order', function (Blueprint $table) {
            $table->foreign('id_customer')->references('id')->on('customer');
            $table->foreign('id_bill')->references('id')->on('bills');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cancel_order');
    }
}