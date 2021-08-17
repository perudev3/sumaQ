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
                                                            <li role="tab" class="done" aria-disabled="false" aria-selected="false" @click="Pedidos" align="center">
                                                                <a id="basic-forms-t-0" aria-controls="basic-forms-p-0">
                                                                    <span class="current-info audible">current step: </span>
                                                                    <span class="number">
                                                                        <i class="fa fa-qrcode fa-3x" aria-hidden="true"></i>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li role="tab" class="done" aria-disabled="false" aria-selected="true" align="center">
                                                                <a id="basic-forms-t-1" aria-controls="basic-forms-p-1">
                                                                    <span class="number"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i></span> 
                                                                </a>
                                                            </li>
                                                            <li role="tab" class="first current" aria-disabled="true" aria-selected="false" align="center">
                                                                <a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
                                                                    <span class="number"><i class="fa fa-list-alt fa-3x" aria-hidden="true"></i></span>
                                                                </a>
                                                            </li>
                                                            <li role="tab" class="done" aria-disabled="false" aria-selected="false"  align="center">
                                                                <a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
                                                                    <span class="number"><i class="fa fa-check-circle fa-3x" aria-hidden="true"></i></span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix" style="margin-top: 50px;">
                                                        <fieldset id="basic-forms-p-0" role="tabpanel" aria-labelledby="basic-forms-h-0" class="body current" aria-hidden="false" style="left: 0px;">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Fecha</span></div>
                                                                                <input type="text"  class="form-control" :value="fecha" disabled>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Usuario</span></div>
                                                                                <input type="text"  class="form-control" :value="user.name" disabled >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Telefono</span></div>
                                                                                <input type="text"  class="form-control" v-model="customers_phone" @change="ObtenerDatosCliente($event)">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Dirección</span></div>
                                                                                <input type="text"  class="form-control" v-model="address">
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">E-mail</span></div>
                                                                                <input type="text"  class="form-control" v-model="customers_mail" >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Referencia</span></div>
                                                                                <input type="text"  class="form-control" v-model="addresses_reference" >
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Nombres y Apellidos</span></div>
                                                                                <input type="text"  class="form-control" v-model="customers_name">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Total a pagar:</span></div>
                                                                                
                                                                                <input type="text"  class="form-control" :value="total" disabled>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Pagará con:</span></div>
                                                                                <input type="text"  class="form-control" v-model="pagar_billete">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Cancelará solo:</span></div>
                                                                                <input type="text"  class="form-control" v-model="total_cancel_layaway">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                <span class="input-group-text"  id="basic-addon1">Saldo:</span></div>
                                                                                <input type="text"  class="form-control" :value="pagar_billete ?  saldo_restante : 0" disabled>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </fieldset>
                                                        <fieldset id="basic-forms-p-0" role="tabpanel" aria-labelledby="basic-forms-h-0" class="body current" aria-hidden="false" style="left: 0px;">
                                                            <div class="mt-4 mb-28 bg-white rounded w-full shadow px-4 py-4">
                                                                <div class="flex justify-end">
                                                                <div
                                                                    @click="finish"
                                                                    class="btn btn-primary">
                                                                     Siguiente
                                                                    <i class="fa fa-chevron-right"></i>
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

export default {

    props:['user'],

	data:function(){
	    return {
            total: this.$route.params.total,
            data_pedidos: this.$route.params.data_pedidos,
            data_customer:{},
            hoy: new Date(),  
            fecha:'',
            pagar_billete:'',
            total_cancel_layaway:'',
            
            customers_name:'',
            customers_mail:'',
            customers_phone:'',
            address:'',
            addresses_reference:'',

	    }
	},

	methods:{

		Compra(){
			this.$router.push({name: "layaway/compra", params: {array_pedidos: this.array_pedidos}})
		},

        Pedidos(){
			this.$router.push({name: "layaway/pedidos"})
		},

        finish(){
			this.$router.push({name: "layaway/finish_layaway",  params: {data_pedidos: this.data_pedidos , data_customer: this.data_customer, total_cancel_layaway: this.total_cancel_layaway}})
		},

        

        ObtenerDatosCliente(telefono){
            var tel= telefono.target.value;
            let self = this;
            axios.get(`/customers/search-phone/${tel}`)
                .then(function(response){
                    if(response.data.customer == null){
                        console.log("NO EXISTE CLIENTE CON EL NUMERO DE TELEFONO -->" + telefono);
                        Swal.fire({
                            title: 'El Cliente con numero '+ tel + ' no existe',
                            type: 'success',
                            confirmButtonText: 'OK'
                        });
                    }else{
                        
                        self.addresses_reference = response.data.customer.addresses_reference;
                        self.customers_mail      = response.data.customer.customers_mail;
                        self.customers_name      = response.data.customer.customers_name;
                        self.address             = response.data.customer.addresses_first_line + ', ' + response.data.customer.addresses_second_line;
                        self.data_customer = {
                            'customers_name' : self.customers_name,
                            'address': self.address,
                            'addresses_reference' : self.addresses_reference,
                            'customers_mail' : self.customers_mail,
                            'customers_phone' : self.customers_phone,
                            
                        };
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
    },
    computed:{
        saldo_restante(){
           return  this.pagar_billete - this.total_cancel_layaway;
        }
    },
    watch: {

        // Observando la propiedad telefono
        customers_phone(val){

            // Si la logitud del telefono es igual a 10
            if( val.length == 10){
                this.ObtenerDatosCliente(val);
            }
            
        },

        

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