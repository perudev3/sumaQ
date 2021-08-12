<template>

	<div class="pcoded-content">
        <div class="pcoded-inner-content">
            <!-- Main-body start -->
            <div class="main-body">
                <div class="page-wrapper">
					<div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">
								<div class="card">
									<div class="card-block">
										<div class="row">
											<div class="col-md-12">
												<div id="wizard1">
													<section>
														<form class="wizard-form wizard clearfix" id="basic-forms">
															<div class="steps clearfix">
																<ul role="tablist">
																	<li role="tab" class="first current" aria-disabled="false" aria-selected="true" align="center">
																		<a id="basic-forms-t-0" aria-controls="basic-forms-p-0">
																			<span class="current-info audible">current step: </span>
																			<span class="number"><i class="fa fa-qrcode fa-3x" aria-hidden="true"></i></span>  
																		</a>
																	</li>
																	<li role="tab" class="done" aria-disabled="false" aria-selected="false" @click="Compra" align="center">
																		<a id="basic-forms-t-1" aria-controls="basic-forms-p-1">
																			<span class="number"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i></span> 
																		</a>
																	</li>
																	<li role="tab" class="done" aria-disabled="false" aria-selected="false" align="center">
																		<a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
																			<span class="number"><i class="fa fa-list-alt fa-3x" aria-hidden="true"></i></span>
																		</a>
																	</li>
																	<li role="tab" class="done" aria-disabled="false" aria-selected="false" align="center">
																		<a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
																			<span class="number"><i class="fa fa-check-circle fa-3x" aria-hidden="true"></i></span>
																		</a>
																	</li>
																</ul>
															</div>	
															<div class="clearfix" style="margin-top: 50px;">
                                                                <fieldset id="basic-forms-p-0" role="tabpanel" aria-labelledby="basic-forms-h-0" class="body current" aria-hidden="false" style="left: 0px;">
                                                                    <div class="row">
																		<div class="col-lg-6">
																			<div class="row">
																				<div class="col-lg-6">
																						<qrcode-stream @decode="onDecode" style="width: 100%;border: 1px solid;padding: 7px;">
																						</qrcode-stream>
																				</div>
																				<div class="col-lg-6">		
																						<autocomplete :search="search_producto"
																								placeholder="Código de Inventario"
																								:get-result-value="getResultValueProduct"
																								@submit="onSubmitProducto"> 
																						</autocomplete>
																				</div>  																				
																			</div>																				
																		</div>
																		<div class="col-lg-6">
																			<div class="card">
																				<div class="card-header" align="center" style="background: #0000001f;">
																					<h3>Detalles del Producto</h3>
																				</div>
																				<div class="card-body">
																					<div class="form-group" align="center">
																						<img :src="data_products.products_image_url ? '/img_products/'+data_products.products_image_url : '/img/logo.jpeg'" />
																					</div>
																					<div class="form-group">
																						<div class="input-group">
																							<div class="input-group-prepend">
																							<span class="input-group-text"  id="basic-addon1">Nombre del Producto</span></div>
																							<input type="text"  :value="data_products.products_name" disabled class="form-control">
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="input-group">
																							<div class="input-group-prepend">
																							<span class="input-group-text"  id="basic-addon1">
																								$
																							</span></div>
																							<input type="text" :value="data_products.discounts_group==[] ? (data_products.discounts_group[0].discounts[0].discounts_porcentaje*data_products.products_price)/100  : data_products.products_price" disabled class="form-control">
																						</div>
																					</div>
																					<div class="form-group">
																						<button type="button" class="btn btn-primary" @click="Agregar_Pedido()">
																							Agregar a Carrito
																						</button>
																					</div>
																				</div>
																			</div>
																			
																		</div>
																	</div>
                                                                </fieldset>
                                                            </div>
														</form>
													</section>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</template>

<script>

import { QrcodeStream, QrcodeDropZone, QrcodeCapture } from 'vue-qrcode-reader';

export default {

	components: {
       QrcodeStream,
       QrcodeDropZone,
       QrcodeCapture
  	},

	data:function(){
	    return {
			data_products:[],
			array_pedidos:[],
			inventories_codigo:'',
			neworder: null,
	    }
	},

	methods:{

		onDecode(decodedString){
			let me = this;
  			var codigo = decodedString;			
            axios.post('/sales_products',{ 'codigo_inventorie':codigo }).then(function(response){
				me.data_products = response.data[0];
				console.log(codigo, me.data_products)
            });
		},

		Agregar_Pedido(){
			console.log(this.inventories_codigo);
			this.neworder = this.inventories_codigo;
            if(!this.neworder) return;
			this.array_pedidos.push(this.neworder);
            this.neworder = '';
            this.saveOrder();
			this.data_products='';
			Swal.fire({
            	title: 'Agregado a Carrito',
            	type: 'success',
            	confirmButtonText: 'OK'
        	})
		},
		
		removeOrder(x) {
            this.array_pedidos.splice(x, 1);
            this.saveOrder();
        },

        saveOrder() {
            let parsed = JSON.stringify(this.array_pedidos);
            localStorage.setItem('array_pedidos', parsed);
        },

		Compra(){
			this.$router.push({name: "sales/compra", params: {array_pedidos: this.array_pedidos}})
		},

		// Buscar producto por codigo de inventario
		search_producto(input) {
				  const url = `/find_by_code_inventory/${encodeURI(input)}`;
			      
			      return new Promise((resolve) => {
			        if (input.length < 2) {
			          return resolve([])
			        }
			 
			        fetch(url)
			          .then((response) => response.json())
			          .then((data) => {
			            resolve(data)
			          })
			      })
		},

		// Mostrar en el select los resultados
		getResultValueProduct(result) {
			return result.products.products_name;
		},

		// Cuando se selecciona un codigo de inventario
		onSubmitProducto(result) {
			this.data_products = result.products;
			this.inventories_codigo = result.inventories_codigo;
			console.log(this.data_products.products_image_url);
		}
	},

	mounted() {
        let self = this
        if (localStorage.getItem('array_pedidos')) {
                try {
                  this.array_pedidos = JSON.parse(localStorage.getItem('array_pedidos'));
                } catch(e) {
                  localStorage.removeItem('array_pedidos');
                }
        };
    }

  
};
</script>

<style>
	
.pcoded-content .nav-pills.nav-wizard > li {
  position: relative;
  overflow: visible;
  border-right: 15px solid transparent;
  border-left: 15px solid transparent;
}
.pcoded-content .nav-pills.nav-wizard > li + li {
  margin-left: 0;
}
.pcoded-content .nav-pills.nav-wizard > li:first-child {
  border-left: 0;
}
.pcoded-content .nav-pills.nav-wizard > li:first-child a {
  border-radius: 5px 0 0 5px;
}
.pcoded-content .nav-pills.nav-wizard > li:last-child {
  border-right: 0;
}
.pcoded-content .nav-pills.nav-wizard > li:last-child a {
  border-radius: 0 5px 5px 0;
}
.pcoded-content .nav-pills.nav-wizard > li a {
  border-radius: 0;
  background-color: #eee;
}
.pcoded-content .nav-pills.nav-wizard > li:not(:last-child) a:after {
  position: absolute;
  content: "";
  top: 0px;
  right: -20px;
  width: 0px;
  height: 0px;
  border-style: solid;
  border-width: 20px 0 20px 20px;
  border-color: transparent transparent transparent #eee;
  z-index: 150;
}
.pcoded-content .nav-pills.nav-wizard > li:not(:first-child) a:before {
  position: absolute;
  content: "";
  top: 0px;
  left: -20px;
  width: 0px;
  height: 0px;
  border-style: solid;
  border-width: 20px 0 20px 20px;
  border-color: #eee #eee #eee transparent;
  z-index: 150;
}
.pcoded-content .nav-pills.nav-wizard > li:hover:not(:last-child) a:after {
  border-color: transparent transparent transparent #aaa;
}
.pcoded-content .nav-pills.nav-wizard > li:hover:not(:first-child) a:before {
  border-color: #aaa #aaa #aaa transparent;
}
.pcoded-content .nav-pills.nav-wizard > li:hover a {
  background-color: #aaa;
  color: #fff;
}
.pcoded-content .nav-pills.nav-wizard > li.active:not(:last-child) a:after {
  border-color: transparent transparent transparent #428bca;
}
.pcoded-content .nav-pills.nav-wizard > li.active:not(:first-child) a:before {
  border-color: #428bca #428bca #428bca transparent;
}
.pcoded-content .nav-pills.nav-wizard > li.active a {
  background-color: #428bca;
}


</style>