<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Products;

class testController extends Controller
{
    //

    public function index(){
        $product = Products::all();
        return [$product,'ha'];
    }
}