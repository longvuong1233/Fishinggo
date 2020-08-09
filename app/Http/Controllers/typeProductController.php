<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TypeProducts;
class typeProductController extends Controller
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
        $typeProduct= TypeProducts::all();
        return view('listTypeProduct',['list'=>$typeProduct]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('addTypeProducts');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        if($request->hasFile('image')){
            $request->file('image')->move(
                'img/typeProduct',$request->image->getClientOriginalName('image')
            );
        }
        $typeProduct= new TypeProducts;
        $typeProduct->name=$request->name;
        $typeProduct->description=$request->description;
        $typeProduct->image='/img/typeProduct/'.$request->image->getClientOriginalName('image');
        $typeProduct->save();
        return redirect()->route('typeproduct.index');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $type='';
        switch($id){
            case '1':{
                $type='cayts';
                break;
            }
            case '2':{
               $type='fish';
                break;
            }
            case '3':{
                $type='shr_nail';
                break;

            }
        }
        return redirect()->route('category',[$type]);
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
        $typeProduct= TypeProducts::find($id);
        return view('editTypeProduct',['typeProduct'=>$typeProduct]);
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
        $typeProduct= TypeProducts::find($id);
        if(strcmp ($request->changeImg,'on')==0){
            if($request->hasFile('image')){
                $request->file('image')->move(
                'img/typeProduct/',$request->image->getClientOriginalName('image')
                );
            }
            $typeProduct->image='/img/typeProduct/'.$request->image->getClientOriginalName();
        }
    
        $typeProduct->name=$request->name;
        $typeProduct->description=$request->description;
      
        $typeProduct->save();

        return redirect()->route('typeproduct.index');
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
        $typeProduct=TypeProducts::find($id)->delete();
        return redirect()->route('typeproduct.index');
    }
}