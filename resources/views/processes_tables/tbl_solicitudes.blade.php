@extends('layouts.dashboard')

@section('content')

    <router-view :user="{{ json_encode($user) }}" :sucursales="{{ json_encode($sucursal) }}" ></router-view>

@endsection