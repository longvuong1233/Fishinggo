<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Staff;

class staffController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $list=Staff::all();
        return view('listStaff',['list'=>$list]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('addStaff');
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
        $staff= new Staff;
        $staff->name=$request->name;
        $staff->address=$request->address;
        $staff->gender=$request->gender;
        $staff->salary=$request->salary;
        $staff->email=$request->email;
        $staff->work=$request->work;
        $staff->birthday=$request->birthday;
        $staff->identity_card=$request->identity_card;
        $staff->save();
        return redirect()->route('home');
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
        $staff=Staff::find($id);
        return view('editStaff',['staff'=>$staff]);
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
        $staff= Staff::find($id);
        $staff->name=$request->name;
        $staff->address=$request->address;
        $staff->gender=$request->gender;
        $staff->salary=$request->salary;
        $staff->email=$request->email;
        $staff->work=$request->work;
        $staff->birthday=$request->birthday;
        $staff->identity_card=$request->identity_card;
        $staff->save();
        return redirect()->route('home');
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
        $staff= Staff::find($id)->delete();
        return redirect()->route('home');
    }
}