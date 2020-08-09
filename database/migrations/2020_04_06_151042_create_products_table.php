<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->bigInteger('id_type')->unsigned();
            $table->text('description');
            $table->float('unit_price');
            $table->float('promotion_price');
            $table->string('image');
            $table->string('unit');
            $table->timestamps();
        });

        Schema::table('products', function (Blueprint $table) {
            $table->foreign('id_type')->references('id')->on('type_products');
        });
    }
    

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
