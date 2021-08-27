@extends('layouts.dashboard')

@section('content')

    <router-view :user="{{ json_encode($user) }}"></router-view>

@endsection