<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBillDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bill_detail', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('id_bill')->unsigned();
            $table->bigInteger('id_product')->unsigned();
            $table->integer('quantity');
            $table->double('unit_price');
            $table->timestamps();
        });

        Schema::table('bill_detail', function (Blueprint $table) {
            $table->foreign('id_bill')->references('id')->on('bills');
            $table->foreign('id_product')->references('id')->on('products');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bill_detail');
    }
}
