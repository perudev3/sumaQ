<template>
	

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
	      	<ul class="nav nav-pills nav-wizard">
			    <li  style="width: 35%;" @click="Pedidos"><a>Pedidos</a></li>
			    <li style="width: 35%;" @click="Compra"><a>Compra</a></li>
			    <li style="width: 30%;" class="active"><a>Pago</a></li>
			</ul>
			<div class="row" style="padding-top: 2%;">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-12 tg-lgcolwidthhalf">
	              <div class="tg-dashboardbox">
	                <div class="tg-dashboardholder">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Fecha</label>	
                                    <input type="text"  class="form-control" :value="fecha" disabled>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Usuario</label>
                                    <input type="text"  class="form-control" :value="user.name" disabled >
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Nombres y Apellidos</label>	
                                    <input type="text"  class="form-control" v-model="customers_name">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Dirección</label>
                                    <input type="text"  class="form-control" v-model="address">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>E-mail</label>
                                    <input type="text"  class="form-control" v-model="customers_mail" >
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Referencia</label>
                                    <input type="text"  class="form-control" v-model="addresses_reference" >
                                </div>
                            </div>
                        
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input type="text"  class="form-control" v-model="customers_phone">
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Total a Pagar:</label>
                                    <label>{{ total }}</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Método de Pago</label>
                                    <select class="form-control" v-model="methodpage">
                                        <option value="efectivo">Efectivo</option>
                                        <option value="tarjeta">Tarjeta</option>
                                    </select> 
                                </div>                                                               
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Acepta terminos y Condiciones</label>	
                                    <input type="checkbox" v-model="check">
                                </div>
                            </div>                            
                        </div>

                            <div class="form-group" v-if="methodpage=='efectivo'">
                                <template v-if="check==false">
                                    <button class="btn btn-primary" disabled>Efectivo</button>
                                </template>
                                <template v-else>
                                    <button class="btn btn-primary" @click="Pagar()">Efectivo</button>
                                </template>
                            </div>

                            <div class="form-group" v-if="methodpage=='tarjeta'">
                                <template v-if="check==false">
                                    <button class="btn btn-primary" disabled>Tarjeta</button>
                                </template>
                                <template v-else>
                                    <button class="btn btn-primary">Tarjeta</button>
                                </template>
                            </div>
	                </div>
	              </div>
	            </div>
			</div>
	      </div>
	    </section>
	</main>



</template>

<script>


export default {

    props:['user'],

	data:function(){
	    return {
            data_districts:[],
			check:false,
            methodpage:'',
            total: this.$route.params.total,
            data_pedidos: this.$route.params.data_pedidos,
            hoy: new Date(),  
            fecha:'',
            
            customers_name:'',
            customers_mail:'',
            customers_phone:'',

            address:'',
            addresses_reference:'',

	    }
	},

	methods:{

		Compra(){
			this.$router.push({name: "sales/compra", params: {array_pedidos: this.array_pedidos}})
		},

        Pedidos(){
			this.$router.push({name: "sales/pedidos"})
		},

        Pagar(){
            let me = this;
            Swal.fire({
				title: 'Cargando...',
				allowEscapeKey: false,
				allowOutsideClick: false,
				onOpen: () => {
				    swal.showLoading();
				}
			});
            axios.post('/post_pago_efectivo',{
				'customers_name' : me.customers_name,
                'customers_mail' : me.customers_mail,
                'customers_phone' : me.customers_phone,
                'address': me.address,
                'addresses_reference': me.addresses_reference,
                'sales_payment_method' : me.methodpage,
                'sales_payment_date' : me.fecha,
                'data_pedidos' : me.data_pedidos,
			}).then(function(response){
                if (response.data.status=='success') {
                    swal.close();
                }				
          	});
        }

	},

	mounted() {
        let self = this
        var mes = self.hoy.getMonth()+1; //obteniendo mes
        var dia = self.hoy.getDate(); //obteniendo dia
        var ano = self.hoy.getFullYear(); //obteniendo año
        if(dia<10)
            dia='0'+dia; //agrega cero si el menor de 10
        if(mes<10)
            mes='0'+mes;
        
        self.fecha = ano+"-"+mes+"-"+dia;
    }

  
};
</script>

<style>
	
.nav-pills.nav-wizard > li {
  position: relative;
  overflow: visible;
  border-right: 15px solid transparent;
  border-left: 15px solid transparent;
}
.nav-pills.nav-wizard > li + li {
  margin-left: 0;
}
.nav-pills.nav-wizard > li:first-child {
  border-left: 0;
}
.nav-pills.nav-wizard > li:first-child a {
  border-radius: 5px 0 0 5px;
}
.nav-pills.nav-wizard > li:last-child {
  border-right: 0;
}
.nav-pills.nav-wizard > li:last-child a {
  border-radius: 0 5px 5px 0;
}
.nav-pills.nav-wizard > li a {
  border-radius: 0;
  background-color: #eee;
}
.nav-pills.nav-wizard > li:not(:last-child) a:after {
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
.nav-pills.nav-wizard > li:not(:first-child) a:before {
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
.nav-pills.nav-wizard > li:hover:not(:last-child) a:after {
  border-color: transparent transparent transparent #aaa;
}
.nav-pills.nav-wizard > li:hover:not(:first-child) a:before {
  border-color: #aaa #aaa #aaa transparent;
}
.nav-pills.nav-wizard > li:hover a {
  background-color: #aaa;
  color: #fff;
}
.nav-pills.nav-wizard > li.active:not(:last-child) a:after {
  border-color: transparent transparent transparent #428bca;
}
.nav-pills.nav-wizard > li.active:not(:first-child) a:before {
  border-color: #428bca #428bca #428bca transparent;
}
.nav-pills.nav-wizard > li.active a {
  background-color: #428bca;
}


</style>