<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SebastianBergmann\Environment\Console;

use App\Customer;
use App\BillDetail;
use App\Bills;
use App\Products;

class confirmController extends Controller
{
    public function index(Request $rq){
        $customer = new Customer;
        $customer->name=$rq->name;
        $customer->gender=$rq->gender;
        $customer->email=$rq->email;
        $customer->address=$rq->address;
        $customer->phone=$rq->phone;
        $customer->note=$rq->note;
        $customer->save();

        $lastCustomer = Customer::latest('id')->first();

        $bill = new Bills;
        $bill->id_customer=$lastCustomer->id;
        $bill->total=$rq->total;
        $bill->payment=$rq->payment;
        $bill->note=$rq->note;
        $bill->save();

        $lastBill = Bills::latest('id')->first();
       
        $cart = preg_split("/[,]+/", $rq->cart);
        
        $uniq_cart=array_unique($cart);
        
        foreach($uniq_cart as $id){
             $billDetail = new BillDetail;
             $billDetail->id_bill=$lastBill->id;
             $billDetail->id_product=$id;
             $count=0;
             foreach($cart as $element){
                if($element==$id){
                    $count++;
                }
             }
             $billDetail->quantity=$count;
             $unit_price= Products::find($id)->unit_price;
             $billDetail->unit_price=$unit_price;
             $billDetail->save();
        }
       return view('congratulations',['id_order'=>$lastBill->id]); 
    }

}