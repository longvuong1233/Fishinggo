<?php

namespace App\Http\Controllers;

use GuzzleHttp\Middleware;
use Illuminate\Http\Request;

use App\Bills;
use App\Customer;
use App\BillDetail;
use App\Products;



class billController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {   
        $this->middleware('auth',['except'=>['show']]);
    }
    public function index()
    {
        //
        $bill= Bills::all();
        return view('listBill',['list'=>$bill]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $bill= Bills::find($id);
        if(strcmp($bill,'')==0){
            return view('showErrorBill');
        }
        
        $customer= Customer::find($bill->id_customer);
        $billDetail= BillDetail::all()->where('id_bill','=',$bill->id)->toArray();
        $array=[];
        $billDetail_change=[];
        $products_change=[];
        foreach($billDetail as $item){
            array_push($billDetail_change,$item);
            array_push($array,$item['id_product']);
        }
        $products=Products::all()->whereIn('id',$array)->toArray();
        foreach($products as $item){
        array_push($products_change,$item);
        }
        
        return
        view('showBill',['customer'=>$customer,'billDetail'=>$billDetail_change,'products'=>$products_change,'bill'=>$bill]);
        
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
        $bill= Bills::find($id);
        return view('editBill',['bill'=>$bill]);
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
            $bill= Bills::find($id);
            $bill->note=$request->note;
            $bill->payment=$request->payment;
            $bill->status=$request->status;
            $bill->save();
            return redirect()->route('bill.index');
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
        $bill= Bills::where('id','=',$id)->delete();
        return redirect()->back();
        
    }
}