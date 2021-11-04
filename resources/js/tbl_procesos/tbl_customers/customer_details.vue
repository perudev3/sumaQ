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
                                        <h4>FIDELIZACION DEL CLIENTE</h4>
                                    </div>
                            	</div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->

                    <!-- Page-body start -->
                    <div class="page-body">
                        <div class="row">
							<div class="col-sm-6">
								<div class=" ">
									<div class="card-block">
										<div class="row">
											<div class="col-lg-12">
                                                <div class="card-sub" align="center" style="box-shadow: 0 0 25px -5px #9e9c9e;">
                                                    <div class="alert alert-warning background-warning">
														{{ sales_customers[0].customers.customers_name }}   
													</div>  
													<div class="card-body">
														<div class="alert alert-success background-success">
															<b>Datos del Cliente</b>
														</div>			
                                                        
														<p><h5>Telefono - <b> {{sales_customers[0].customers.customers_phone }}</b></h5></p>
														<p><h5>Direccion - <b>{{sales_customers[0].customers.address.addresses_first_line}} - {{sales_customers[0].customers.address.addresses_second_line}}</b> </h5> </p>
													</div>
                                                </div>
                                            </div>
										</div>
									</div>
								</div>
							</div>  
                            <div class="col-sm-3">
                                <div class="card bg-c-green update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">$ {{ parseFloat(calcularTotalGanancia).toFixed(2) }} </h4>
                                                <h6 class="text-white m-b-0">TOTAL EN GANANCIAS</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-1" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="card bg-c-yellow update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h6 class="text-white m-b-0">NÚMERO DE COMPRAS</h6>
                                                <h4 class="text-white"> {{ sales_customers.length }} </h4>
                                                
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-1" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
							<div class="col-sm-12">
								<div class=" ">
                                    <div class="card-block">
                                        <div class="card-block table-border-style">
                                            <div class="dt-responsive table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
															<th>Fecha de Compra</th>
															<th>Estado</th>
															<th>Metodo de  Pago</th>
                                                            <th>Ganancia</th>
															<th>Opciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="(data, index) in sales_customers">															
															<td>
																{{data.sales_payment_date}}
															</td>
															<td>
																<span v-if="data.sales_status==1" style="background: #008000a8;padding: 3px;border-radius: 4px;color: #fff;"> Vendido </span>
                                                                <span v-else style="background: red;padding: 3px;border-radius: 4px;color: #fff;"> No Vendido </span>
															</td>
															
															<td>
																{{data.sales_payment_method}}
															</td>
                                                            <td>
                                                                $ {{ data.sales_profits[0].total_bussines }}
                                                            </td>
															<!-- <td>
																<button class="btn btn-primary">Ver</button>
															</td> -->
                                                        </tr>

                                                    </tbody>
                                                </table>
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

export default({

    data(){
        return {
            customers_id: this.$route.params.customers_id,
            sales_customers:[],
        }
    },

    computed : {

        calcularTotalGanancia(){
			var resultado=0.0;
			for(var i=0;i<this.sales_customers.length;i++){
				resultado= resultado + this.sales_customers[i].sales_profits[i].total_bussines;
			}
			return resultado;
		},

        calcularTotalCompras(){
			var resultado=0.0;
			for(var i=0;i<this.sales_customers.length;i++){
				resultado= resultado + this.sales_customers[i].sales_profits[i].total_bussines;
			}
			return resultado;
		},

	},

    methods:{
        DataCustomers(){
            let me = this;
            axios.post('/sales_customers',{
                'customers_id': me.customers_id
            }).then(function(response){
                me.sales_customers=response.data;
                console.log(me.sales_customers[0].customers.address);
            })
        }
    },

    mounted() {
        let self = this
        setTimeout(function(){
            self.DataCustomers();
        },1000);
    } 


})
</script>
