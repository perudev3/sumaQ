<template>
	
	<div class="pcoded-content">
        <div class="pcoded-inner-content">
            <!-- Main-body start -->
            <div class="main-body">
				<!--Modal-->
					<div  class="permiso" :class="{'mostrar' : modal}" style="overflow-y: auto;padding-top: 50px;">
						<div class="permiso-content">
								<div class="modal-header">
									<button @click="Cerrar"> X </button>
								</div>
									<div class="modal-body">
										<div class="container">
										<div class="form-group">
											<label>Por favor, ingresar motivo de la cancelacion de pedido</label>
											<input type="text" class="form-control" v-model="sales_canceled_reason">
										</div>
										</div>
									</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" @click="CanceledSales()">Guardar</button>
								</div>
						</div>            
					</div>
				<!--Cerrar Modal-->
                <div class="page-wrapper">
                    <!-- Page-header start -->
                    <div class="page-header">
                        <div class="row align-items-end">
                            <div class="col-lg-12">
                            	<div class="page-header-title">
                                    <div class="d-inline">
                                        <h4>DETALLES DE VENTAS</h4>
                                    </div>
                            	</div>
                            </div>
							<div class="col-lg-3">
                                <div class="card bg-c-yellow update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">$ {{ parseFloat(calcularTotal).toFixed(2) }}</h4>
                                                <h6 class="text-white m-b-0">TOTAL</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-1" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->

                    <!-- Page-body start -->
                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Zero config.table start -->
                                <div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col-md-3">
												<button class="btn btn-primary" v-on:click="busquedadetails = !busquedadetails">Filtrar Busqueda</button>
											</div>
											<div class="col-md-3">
												<button class="btn btn-primary" v-on:click="busquedafechas = !busquedafechas">Filtrar por Día/Mes/Año</button>
											</div>
											
										</div><br>
										<transition name="fade">
												<div class="row" v-if="busquedadetails">
															<div class="col-md-3">
																<label> Nombre del Cliente</label>
																<input type="text" class="form-control" v-model="customers_name">
															</div>
															<div class="col-md-2">
																<label> Fecha de Inicio</label>
																<input type="date" class="form-control" v-model="date_init">
															</div>
															<div class="col-md-2">
																<label> Fecha de Fin</label>
																<input type="date" class="form-control" v-model="date_end">
															</div>
															<div class="col-md-2">
																<button class="btn btn-success" style="margin-top: 35px;" @click="FilterByDate()">
																	Burcar <i class="fa fa-filter"></i>
																</button>
															</div>
															<div class="col-md-2">
																<button class="btn btn-primary" style="margin-top: 35px;" @click="GetSalesDetails()">
																	Todos <i class="fa fa-search"></i>
																</button>
															</div>
												</div>
										</transition>
										<transition name="fade">
											<div class="row" v-if="busquedafechas">
												<div class="col-md-3">
													<div class="form-group">
														<label>Seleccionar Día</label>
														<input type="date" class="form-control" v-model="day" @change="onChangeDay($event)">
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label>Seleccionar Mes</label>
														<input type="month" class="form-control" v-model="month" @change="onChangeMonth($event)">
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label>Seleccionar Año</label>
														<select class="form-control" @change="onChangeYear($event)" v-model="year">
															<option v-for="data in years" :value="data">{{ data }}</option>
														</select>
													</div>
												</div>
												<div class="col-md-2">
													<button class="btn btn-primary" style="margin-top: 30px;" @click="GetSalesDetails()">
														Todos <i class="fa fa-search"></i>
													</button>
												</div>
											</div>
										</transition>
									</div>
                                    <div class="card-block">
                                        <div class="card-block table-border-style">
                                            <div class="dt-responsive table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Cliente</th>
															<th>Telefono</th>
															<th>Metodo de Pago</th>
															<th>Fecha de Pago</th>
															<th>Estado de Pedido</th>
															<th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr  v-for="(data, index) in data_details_sales" :key="index">
                                                           <td>
																{{data.customers ? data.customers.customers_name : ''}}
															</td>
															<td>
																{{data.customers.customers_phone}}
															</td>
															<td>
																{{data.sales_payment_method}}
															</td>
															<td>
																{{data.sales_payment_date}}
															</td>
															<td align="center">
																<label v-if="data.sales_status==0">En Tienda</label>
																<label v-if="data.sales_status==1">Despachado</label>
																<label v-if="data.sales_status==2">Entregado</label>
																<label v-if="data.sales_status==3">Cencelado</label>
															</td>
															<td>
																<select class="form-control" @change="onChange($event,data.sales_id)" v-model="data.sales_status" >
																	<option value="1">Despachado</option>
																	<option value="2">Entregado</option>
																	<option value="3">Cancelado</option>
																</select>
															</td>
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

export default {

	data:function(){
	    return {
			data_details_sales:[],
			busquedadetails:false,
			busquedafechas:false,
			status:'',
			sales_id:'',
			modal:0,
			day:'',
			month:'',
			year:'',
			sales_canceled_reason:'',
			date_init:'',
			date_end:'',
			customers_name:'',
			total_count:'',
	    }
	},

	computed : {
		years () {
			const year = new Date().getFullYear()
			return Array.from({length: year - 1900}, (value, index) => 1901 + index)
		},

		calcularTotal(){
			var resultado=0.0;
			for(var i=0;i<this.total_count.length;i++){
				resultado= resultado + this.total_count[i].sales_profits[i].total_bussines;
			}
			return resultado;
		}

	},

	methods:{

		Cerrar(){
			this.modal=0;
		},

		GetSalesDetails(){
			let me = this;		
			axios.post('/get_layaway_details').then(function(response){
				me.data_details_sales = response.data;
				me.total_count = response.data;
			});
		},

		CanceledSales(){
			let me = this;
			axios.put('/update_statuslayaway',{
				'layaway_canceled_reason':me.sales_canceled_reason,
				'status': me.status, 
				'layaway_id': me.sales_id
			}).then(function(response){
				if (response.data.status=='success') {
					me.GetSalesDetails();
					me.modal=0;
				}
			});
		},

		onChange(event, sales_id){
			let me = this;
			me.status = event.target.value;	
			if (me.status==3) {
				me.modal = 1;
				me.sales_id = sales_id;
			}else{
				me.sales_id = sales_id;
				axios.put('/update_statuslayaway',{
					'status': me.status, 
					'layaway_id': me.sales_id
				}).then(function(response){
					if (response.data.status=='success') {
						me.GetSalesDetails();
					}
				});
			}
		},

		onChangeDay(event){
			let me = this;
			var changeDay= event.target.value;
			var day = changeDay.split("-");
			axios.post('/getlayawaydate',{
				'day': day[2],
			}).then(function(response){
				me.data_details_sales = response.data;
				me.total_count = response.data;
			});
			
		},

		onChangeMonth(event){
			let me = this;
			var changeMonth= event.target.value;
			var month = changeMonth.split("-");
			axios.post('/getlayawaymonth',{
				'month': month[1],
			}).then(function(response){
				me.data_details_sales = response.data;
				me.total_count = response.data;
			});
		},

		onChangeYear(event){
			let me = this;
			var changeYear= event.target.value;
			axios.post('/getlayawayyear',{
				'year': changeYear,
			}).then(function(response){
				me.data_details_sales = response.data;
				me.total_count = response.data;
			});			
		},

		FilterByDate(){
			let me = this;
			axios.post('/findBylayawayDate',{
				'customers_name': me.customers_name,
				'date_init': me.date_init, 
				'date_end': me.date_end
			}).then(function(response){
				me.data_details_sales = response.data;
				me.total_count = response.data;
			});
		}


	},

	mounted() {
        let self = this
        self.GetSalesDetails();
    }

  
};
</script>

<style>
	
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0
}

.permiso.mostrar {
    background-color: rgba(0,0,0,.5);
    opacity: 1;
    visibility: visible;
}
.permiso {
    align-items: flex-start;
    background-color: #fff;
    display: flex !important;
    height: 100vh;
    justify-content: center;
    left: 0;
    opacity: 0;
    position: fixed;
    top: 0;
    visibility: hidden;
    width: 100%;
    transition: all 0.40s cubic-bezier(0.39, 0.575, 0.565, 1);
    z-index: 5000;
}

  	.permiso.mostrar .permiso-content {
        opacity: 1;
        transform: scale(1.1);
        visibility: visible;
    }
    .permiso .permiso-content {
		background: #fff;
        border-radius: 3px;
        box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
        margin-top: 50px;
        opacity: 0;
        padding: 4px;
        transform: scale(1);
        transition: all .40s cubic-bezier(0.39, 0.575, 0.565, 1);
        visibility: hidden;
    }
</style>