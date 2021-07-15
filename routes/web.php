<?php

use Illuminate\Support\Facades\Route;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\SucursalController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index')->name('home');



/***Category***/
Route::prefix('category')->group(function () {
	Route::get('/', function () {
		$name_view = 'CATEGORIA';
		return view('master_tables.mae_category', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'CATEGORIA';
		return view('master_tables.mae_category', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'CATEGORIA';
		return view('master_tables.mae_category', compact('name_view'));
	});

	Route::get('/search_category', 'CategoryController@SearchCategory');
});

Route::get('get_categories', 'CategoryController@GetCategories');
Route::post('post_categories', 'CategoryController@PostCategories');
Route::post('edit_categories', 'CategoryController@EditCategories');


/***Colletion***/

Route::prefix('collection')->group(function () {
	Route::get('/', function () {
		$name_view = 'COLECCIÓN';
		return view('master_tables.mae_collections', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'COLECCIÓN';
		return view('master_tables.mae_collections', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'COLECCIÓN';
		return view('master_tables.mae_collections', compact('name_view'));
	});

	Route::get('/search_collection', 'CollectionsController@SearchCollection');
});
Route::get('get_collection', 'CollectionsController@GetCollections');
Route::post('post_collection', 'CollectionsController@PostCollections');
Route::post('edit_collection', 'CollectionsController@EditCollections');

/***Discounts***/

Route::prefix('discount')->group(function () {
	Route::get('/', function () {
		$name_view = 'DESCUENTOS';
		return view('master_tables.mae_discounts', compact('name_view'));
	});

	Route::get('/create_group', function () {
		$name_view = 'DESCUENTOS';
		return view('master_tables.mae_discounts', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'DESCUENTOS';
		return view('master_tables.mae_discounts', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'DESCUENTOS';
		return view('master_tables.mae_discounts', compact('name_view'));
	});

	Route::get('/search_discount', 'DiscountController@SearchDiscounts');
});
Route::get('get_group_discount', 'DiscountController@GetGroupDiscounts');
Route::get('get_discount', 'DiscountController@GetDiscounts');
Route::post('post_discount', 'DiscountController@PostDiscounts');
Route::post('edit_discount', 'DiscountController@EditDiscounts');


/***Materials***/
Route::prefix('material')->group(function () {
	Route::get('/', function () {
		$name_view = 'MATERIAL';
		return view('master_tables.mae_materials', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'MATERIAL';
		return view('master_tables.mae_materials', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'MATERIAL';
		return view('master_tables.mae_materials', compact('name_view'));
	});

	Route::get('/search_material', 'MaterialController@SearchMaterials');
});

Route::get('get_material', 'MaterialController@GetMaterials');
Route::post('post_material', 'MaterialController@PostMaterials');
Route::post('edit_material', 'MaterialController@EditMaterials');

/***Sucursals***/
Route::prefix('sucursal')->group(function () {

	Route::get('/', function () {
		$name_view = 'SUCURSAL';
		return view('master_tables.mae_sucursals', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'SUCURSAL';
		return view('master_tables.mae_sucursals', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'SUCURSAL';
		return view('master_tables.mae_sucursals', compact('name_view'));
	});

	// Seleeccionar sucursal al iniciar sesion
	Route::get('seleccionar', 'SucursalController@seleccionarSucursal')->name('sucursal.seleccionar.get');
	Route::post('seleccionar', 'SucursalController@seleccionarSucursalPost')->name('sucursal.seleccionar.post');

});

/***Usuarios***/
Route::prefix('user')->group(function () {

	Route::get('/', function () {
		$name_view = 'Usuarios';
		return view('master_tables.mae_user', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'Usuarios';
		return view('master_tables.mae_user', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'Usuarios';
		return view('master_tables.mae_user', compact('name_view'));
	});

	Route::get('/search_users', 'UserController@SearchUsers');
});

Route::get('get_users', 'UserController@GetUsers');
Route::post('post_users', 'UserController@PostUsers');


/***Providers***/
Route::prefix('provider')->group(function () {
	Route::get('/', function () {
		$name_view = 'PROVEEDOR';
		$user = \Auth::user();
		return view('master_tables.mae_providers', compact('name_view', 'user'));
	});

	Route::get('/create', function () {
		$name_view = 'PROVEEDOR';
		$user = \Auth::user();
		return view('master_tables.mae_providers', compact('name_view', 'user'));
	});

	Route::get('/edit', function () {
		$name_view = 'PROVEEDOR';
		$user = \Auth::user();
		return view('master_tables.mae_providers', compact('name_view', 'user'));
	});

	Route::get('/purchase_orders/lista', function () {
		$name_view = 'PROVEEDOR';
		$user = \Auth::user();
		return view('master_tables.mae_providers', compact('name_view', 'user'));
	});

	Route::get('/search_providers', 'ProviderController@SearchProviders');
});


Route::get('get_provider', 'ProviderController@GetProvider');
Route::post('post_provider', 'ProviderController@PostProvider');
Route::post('edit_providers', 'ProviderController@EditProviders');


/***Products***/
Route::prefix('products')->group(function () {
	Route::get('/', function () {
		$name_view = 'PRODUCTOS';
		return view('processes_tables.tbl_products', compact('name_view'));
	});

	Route::get('/create', function () {
		$name_view = 'PRODUCTOS';
		return view('processes_tables.tbl_products', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'PRODUCTOS';
		return view('processes_tables.tbl_products', compact('name_view'));
	});

	Route::get('/search_products', 'ProductsController@SearchProducts');
});

Route::get('get_products', 'ProductsController@GetProducts');
//Route::post('post_products', 'ProductsController@PostProducts');
Route::post('/post_products', 'ProductsController@PostProducts');
Route::post('/put_products', 'ProductsController@PutProducts');
Route::get('/generate_qr/{id}', 'ProductsController@GenerateQR');

/***Sales***/
Route::prefix('sales')->group(function () {
	Route::get('/pedidos', function () {
		$name_view = 'GENERAR VENTA';
		$user = \Auth::user();
		return view('processes_tables.tbl_sales', compact('name_view', 'user'));
	});

	Route::get('/compra', function () {
		$name_view = 'GENERAR VENTA';
		$user = \Auth::user();
		return view('processes_tables.tbl_sales', compact('name_view', 'user'));
	});

	Route::get('/pago', function () {
		$name_view = 'GENERAR VENTA';
		$user = \Auth::user();
		return view('processes_tables.tbl_sales', compact('name_view', 'user'));
	});
});
Route::post('sales_products', 'SalesController@Data_Products');
Route::post('get_products_pedidos', 'SalesController@Data_Products_Pedidos');
Route::post('/post_pago_efectivo', 'SalesController@PostSales');


/***Inventories***/
Route::prefix('inventory')->group(function () {
	Route::get('/', function () {
		$name_view = 'INVENTARIO';
		return view('processes_tables.tbl_inventories', compact('name_view'));
	});

	Route::get('/edit', function () {
		$name_view = 'INVENTARIO';
		return view('processes_tables.tbl_inventories', compact('name_view'));
	});
});

Route::get('get_inventario', 'InventoryController@GetInventario');
Route::get('/generate_qr_inventorie/{codigo}', 'InventoryController@GenerateQRInventorie');
Route::get('/find_by_code_inventory/{codigo}', 'InventoryController@findByInventoryCode');

Route::get('data_districts', 'DistrictsController@GetDistricts');

/**PurcheaseOrders**/
Route::get('/search_producto/{products_name}', 'ControllerPurchase_Orders@SearchProducto');
Route::get('/search_proveedor/{providers_name}', 'ControllerPurchase_Orders@SearchProveedor');
Route::post('/post_order', 'ControllerPurchase_Orders@CreateListOrder');
Route::get('/get_purchaseorder', 'ControllerPurchase_Orders@GetPurchaseOrder');
Route::post('/post_confirm_order', 'ControllerPurchase_Orders@Confirm_Order');
Route::post('/post_recibido_order', 'ControllerPurchase_Orders@Recibido_Order');
Route::post('/get_pedidos', 'ControllerPurchase_Orders@GetPedidos');
Route::post('/post_pedido', 'ControllerPurchase_Orders@UpdatePedido');
Route::post('/get_list_products', 'ProductsController@GetListProducts');
Route::post('/create_groupdiscounts', 'DiscountController@CreateGroupDiscounts');

/** Customers ***/
Route::prefix('customers')->group(function () {


	Route::get('/', function () {
		$name_view = 'CLIENTES';
		return view('processes_tables.tbl_customers', compact('name_view'));
	});


	// Busqueda de un cliente por numero de celular
	Route::get('/search-phone/{phone}', 'CustomerController@findByPhone');

	
});

Route::get('get_customers', 'CustomerController@getCustomers');
Route::get('search_customers', 'CustomerController@searchCustomers');