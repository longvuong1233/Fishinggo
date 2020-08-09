<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Products;
use App\TypeProducts;

use function GuzzleHttp\json_decode;

class itemController extends Controller
{
    public function home()
    {
        $typeProduct = TypeProducts::paginate(6);
        return view('welcome', ['list' => $typeProduct, 'name' => 'typeproduct']);
    }
    public function introduce()
    {
        return view('introduce');
    }
    public function homePage()
    {
        return view('index');
    }
    public function index($type)
    {
        $id_type = 0;
        switch ($type) {
            case 'fish': {
                    $id_type = 2;
                    break;
                }
            case 'cayts': {
                    $id_type = 1;
                    break;
                }
            case 'shr_nail': {
                    $id_type = 3;
                    break;
                }
            case 'light': {
                    $id_type = 4;
                    break;
                }
            case 'aquarium': {
                    $id_type = 5;
                    break;
                }
            case 'tankfilter': {
                    $id_type = 6;
                    break;
                }
            case 'food': {
                    $id_type = 7;
                    break;
                }
            case 'accessories': {
                    $id_type = 8;
                    break;
                }
        }
        $product = Products::all()->where('id_type', '=', $id_type);

        // var_dump($product);
        // $list=[];
        // foreach($product as $item){
        //     return $item;
        // }
        return  $product;
        //return view('welcome', ['list'=>$product,'name'=>'products']);
    }
}