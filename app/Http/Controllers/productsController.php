<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Products;
use App\TypeProducts;
use Illuminate\Support\Facades\Auth;

class productsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['show']]);
    }

    public function index()
    {
        //
        
        $product= Products::paginate(10);
        return view('listProducts',['list'=>$product]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $typeProduct = TypeProducts::all();

        return view("addProducts",['listType'=>$typeProduct]);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($request->hasFile('image')){
            $request->file('image')->move(
                'img/products/',$request->image->getClientOriginalName('image')
            );
        }
        $product= new Products;
        $product->name=$request->name;
        $product->id_type=$request->id_type;
        $product->description=$request->description;
        $product->unit_price=$request->unit_price;
        $product->promotion_price=$request->promotion_price;
        $product->unit=$request->unit;
        $product->image='/img/products/'.$request->image->getClientOriginalName();
        $product->save();
        return redirect()->route('products.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $item= Products::find($id);
        return $item;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $product= Products::find($id);
        $typeProduct=TypeProducts::all();
        return view('editProduct',['product'=>$product,'listType'=>$typeProduct]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $product= Products::find($id);
        if(strcmp ($request->changeImg,'on')==0){
            if($request->hasFile('image')){
                $request->file('image')->move(
                'img/products/',$request->image->getClientOriginalName('image')
                );
            }
            $product->image='/img/products/'.$request->image->getClientOriginalName();
        }
        $product->name=$request->name;
        $product->id_type=$request->id_type;
        $product->description=$request->description;
        $product->unit_price=$request->unit_price;
        $product->promotion_price=$request->promotion_price;
        $product->unit=$request->unit;
       
        $product->save();
        return redirect()->route('products.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $product=Products::find($id)->delete();
        return redirect()->route('products.index');
    }
}