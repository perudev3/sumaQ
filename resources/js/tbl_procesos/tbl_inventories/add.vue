<template>
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <!-- Main-body start -->
            <div class="main-body">
                <div class="page-wrapper">
                    <!-- Page-header start -->
                    <div class="page-header">
                        <div class="row align-items-end">
                            <div class="col-lg-8">
                            <div class="page-header-title">
                                <div class="d-inline">
                                    <h4>AGREGAR INVENTARIO</h4>                                                        
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-body">
                    <div class="row">
                        <div class="col-sm-6">
								<div class=" ">
									<div class="card-block">
										<div class="row">
											<div class="col-lg-12">
                                                <div class="card-sub" align="center">
                                                    <div class="alert alert-warning background-warning">
														{{ data_products.products_name }}   
													</div>
                                                    <img class="card-img-top img-fluid"
                                                        :src="'/img_products/'+data_products.products_image_url" 
                                                        alt="Card image cap"
														style="width: 20%;">    
													<div class="card-body">
														<div class="alert alert-success background-success">
															<b>Detalles del Producto</b>
														</div>													
														<p><h5>Precio - <b>$ {{data_products.products_price }}</b> </h5> </p>
														<p><h5>Categoria - <b>{{data_products.category.categories_name}}</b> </h5> </p>
													</div>
                                                </div>
                                            </div>
										</div>
									</div>
								</div>
						</div>  
                        <div class="col-sm-6">
                            <!-- Basic Form Inputs card start -->
                            <div class="card">
                                <div class="card-block">
                                    <div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="alert alert-default background-default">
													<button class="btn btn-primary" @click="create_inputs">+ Agregar</button>
                                                    <button class="btn btn-success" @click="GuardarInventario()">Guardar</button>
												</div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="row" v-for="(inp, index) in inputs_add">
                                                    <div class="col-lg-4" >
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Cantidad</span></div>
                                                            <input type="text" class="form-control" v-model="inp.cantidad">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Medidas</span></div>
                                                            <input type="text" class="form-control" v-model="inp.medidas">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <button class="btn btn-primary" @click="removeOrder(index)">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
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
        </div>
    </div>
	
</template>


<script>

export default {

    data:function(){
        return {
            inputs_add:[{ cantidad:'', medidas:'',}],
			products_id: this.$route.params.products_id,
            data_products:[],
            cantidad:'',
            medidas:'',
        }
    },


    methods:{

        getDetailsInventory(){
              let me=this;
			  Swal.fire({
                	title: 'Cargando...',
                  allowEscapeKey: false,
                  allowOutsideClick: false,
                  onOpen: () => {
                  swal.showLoading();
                  }
            	});
              axios.get('/inventory_details/'+me.products_id).then(function(response){
                me.data_inventory = response.data.lista;
				me.data_products = response.data.product;
				swal.close();
                console.log(me.data_inventory, me.data_products);
          });
        },

        GuardarInventario(){
                let me=this;
                axios.post('/inventory_add',{
                    'inputs_add' : this.inputs_add,
                    'products_id': me.products_id,
                }).then(function(response){
                    Swal.fire({
                        title: 'Exito!!',
                        text: 'Exito al aumentar inventario',
                        type: 'success',
                        confirmButtonText: 'OK'
                    });
                    me.$router.replace('/inventory');
                });
        },

        create_inputs(){
            this.inputs_add.push({ cantidad:'', medidas:'', });
        },

        removeOrder(x) {
            this.inputs_add.splice(x, 1);
        },

    },

    mounted() {
        let self = this
        setTimeout(function(){
            self.getDetailsInventory();
        },2000);
    }
  
};
</script>