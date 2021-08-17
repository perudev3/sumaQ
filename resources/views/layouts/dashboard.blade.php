<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <title>{{ config('app.name', 'SumaQ') }}</title>
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#">
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="E-Pask">
    <!-- Favicon icon -->
    <link rel="icon" href="{{ asset('new_sumaq/assets/images/favicon.ico') }}" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="{{ asset('new_sumaq/bower_components/bootstrap/dist/css/bootstrap.min.css') }}">
    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="{{ asset('new_sumaq/assets/icon/feather/css/feather.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('new_sumaq/assets/css/font-awesome.min.css') }}">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="{{ asset('new_sumaq/assets/css/style.css') }}">
    
    <link rel="stylesheet" type="text/css" href="{{ asset('new_sumaq/assets/css/jquery.mCustomScrollbar.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('new_sumaq/bower_components/jquery.steps/demo/css/jquery.steps.css') }}">
</head>

<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper" id="app">

            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">

                    <div class="navbar-logo">
                        <a class="mobile-menu" id="mobile-collapse">
                            <i class="feather icon-menu"></i>
                        </a>
                        <a href="index.html">
                            <img class="img-fluid" src="{{ asset('new_sumaq/assets/images/logo.png') }}" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options">
                            <i class="feather icon-more-horizontal"></i>
                        </a>
                    </div>

                    <div class="navbar-container">
                        <ul class="nav-left">
                            <li class="header-search">
                                <span class="pcoded-micon"><i class="feather icon-menu"></i></span> {{$name_view}}
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <li class="user-profile header-notification">
                                <div class="dropdown-primary dropdown ">
                                    <div class="dropdown-toggle" data-toggle="dropdown">
                                        <img src="{{ asset('new_sumaq/assets/images/avatar-4.jpg') }}" class="img-radius"
                                            alt="User-Profile-Image">
                                        <span> Bienvenido(a) {{ Auth::user()->name }}  </span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="pcoded-navigatio-lavel">Menú</div>                            
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="{{url('/')}}">
                                        <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                                        <span class="pcoded-mtext">Dashboard</span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="feather icon-edit"></i></span>
                                        <span class="pcoded-mtext">Registros Maestros</span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="{{url('/category')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext"> Categorias</span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="{{url('/collection')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext"> Colección</span>
                                            </a>
                                        </li>  

                                        <li class=" ">
                                            <a href="{{url('/material')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext"> Material</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="feather icon-sidebar"></i></span>
                                        <span class="pcoded-mtext">POS</span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li>
                                            <a href="{{url('/sales/pedidos')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext">Ventas</span>
                                            </a>                                    
                                        </li> 
                                        <li>
                                            <a href="{{url('/sales/details')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext">Detalles Ventas</span>
                                            </a>                                    
                                        </li>
                                    </ul>
                                </li>
                                <li class="">
                                    <a href="{{url('/provider')}}">
                                        <span class="pcoded-micon"><i class="fa fa-sitemap"></i></span>
                                        <span class="pcoded-mtext">Provedores</span>
                                    </a> 
                                </li>
                                <li class="">
                                    <a href="{{url('/products')}}">
                                        <span class="pcoded-micon"><i class="fa fa-sitemap"></i></span>
                                        <span class="pcoded-mtext">Productos</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="{{url('/inventory')}}">
                                        <span class="pcoded-micon"><i class="fa fa-sitemap"></i></span>
                                        <span class="pcoded-mtext">Inventario</span>
                                    </a>   
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="feather icon-sidebar"></i></span>
                                        <span class="pcoded-mtext">LAYAWAY</span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li>
                                            <a href="{{url('/layaway/pedidos')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext">Ventas</span>
                                            </a>                                    
                                        </li> 
                                        <li>
                                            <a href="{{url('/layaway/details')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext">Detalles Ventas</span>
                                            </a>                                    
                                        </li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="{{url('/customers')}}">
                                        <span class="pcoded-micon"><i class="feather icon-users"></i></span>
                                        <span class="pcoded-mtext"> Clientes</span>
                                    </a>
                                </li>  

                                <li>
                                    <a href="{{url('/sucursal')}}">
                                        <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                                        <span class="pcoded-mtext"> Sucursales</span>
                                    </a>
                                </li>  

                                <li>
                                    <a href="{{url('/discount')}}">
                                        <span class="pcoded-micon"><i class="feather icon-percent"></i></span>
                                        <span class="pcoded-mtext">Descuentos</span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="feather icon-list"></i></span>
                                        <span class="pcoded-mtext">Reportes</span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="{{url('/sales/report')}}">
                                                <i class="fa fa-sitemap"></i>
                                                <span class="pcoded-mtext"> Ventas</span>
                                            </a>
                                        </li> 
                                    </ul>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="feather icon-settings"></i></span>
                                        <span class="pcoded-mtext">Configuraciones</span>
                                    </a>
                                    
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="{{url('/user')}}">
                                                <i class="feather icon-user"></i>
                                                <span class="pcoded-mtext"> Usuarios</span>
                                            </a>
                                        </li> 
                                        <li class="pcoded-hasmenu">
                                            <a href="javascript:void(0)">
                                                <i class="feather icon-home"></i>
                                                <span class="pcoded-mtext"> Sucursal : {{session('sucursal')[0]->sucursals_name }} </span>
                                            </a>
                                            <ul class="pcoded-submenu">
                                                <li class=" ">
                                                        <a href="{{route('sucursal.seleccionar.post')}}">
                                                            <i class="feather icon-home"></i>
                                                            <span class="pcoded-mtext"> <button class="btn btn-primary">Cambiar Sucursal</button> </span>
                                                        </a>
                                                </li> 
                                            </ul>
                                        </li>
                                        <li class=" ">
                                            <a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                                <i class="feather icon-log-out"></i>
                                                <span class="pcoded-mtext">Cerrar Sesión</span>
                                            </a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <div class="main-body">
                                <div class="page-wrapper">

                                    <div class="page-body"> -->

                                            <!--  Content Laravel-->
                                                @yield('content')
                                            <!--  Content Laravel -->
<!-- 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
 -->
                    
                </div>
            </div>
        </div>
    </div>

    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/jquery/dist/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/jquery-ui/jquery-ui.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/popper.js/dist/umd/popper.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/bootstrap/dist/js/bootstrap.min.js') }}"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/jquery-slimscroll/jquery.slimscroll.js') }}"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/modernizr/modernizr.js') }}"></script>
    <!-- Chart js -->
    <script type="text/javascript" src="{{ asset('new_sumaq/bower_components/chart.js/dist/Chart.js') }}"></script>
    <!-- amchart js -->
    <script src="{{ asset('new_sumaq/assets/pages/widget/amchart/amcharts.js') }}"></script>
    <script src="{{ asset('new_sumaq/assets/pages/widget/amchart/serial.js') }}"></script>
    <script src="{{ asset('new_sumaq/assets/pages/widget/amchart/light.js') }}"></script>
    <script src="{{ asset('new_sumaq/assets/js/jquery.mCustomScrollbar.concat.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('new_sumaq/assets/js/SmoothScroll.js') }}"></script>
    <script src="{{ asset('new_sumaq/assets/js/pcoded.min.js') }}"></script>
    <!-- custom js -->
    <script src="{{ asset('new_sumaq/assets/js/vartical-layout.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('new_sumaq/assets/pages/dashboard/custom-dashboard.js') }}"></script>
    <script type="text/javascript" src="{{ asset('new_sumaq/assets/js/script.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="{{ mix('js/app.js') }}" defer></script>

</body>
</html>