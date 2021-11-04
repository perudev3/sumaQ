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
                                                    <div class="wizard-form wizard clearfix" id="basic-forms">
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
                                                                <li role="tab" class="done" aria-disabled="true" aria-selected="false" align="center">
                                                                <a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
                                                                    <span class="number"><i class="fa fa-list-alt fa-3x" aria-hidden="true"></i></span>
                                                                </a>
                                                                </li>
                                                                <li role="tab" class="first current" aria-disabled="false" aria-selected="false" align="center">
                                                                    <a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
                                                                        <span class="number"><i class="fa fa-check-circle fa-3x" aria-hidden="true"></i></span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix" style="margin-top: 50px;" align="center">
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="body-ticket">
                                                                        <div class="ticket">            
                                                                            <i class="fa fa-check-circle fa-3x" aria-hidden="true" style="color: #008000a1;font-size: 65px;"></i>
                                                                                <p class="centered">SumaQ
                                                                                    <br><strong>Teléfono :</strong> 989906922
                                                                                    <br><strong>Dirección: </strong> Puerto Rico
                                                                                    <br><strong>Fecha: </strong>{{fecha}}
                                                                                    <br><strong>Ticket Nº: </strong> 0001
                                                                                </p>
                                                                                <p >
                                                                                    <strong>Cliente :</strong> {{ data_customer.customers_name }}
                                                                                    <br><strong>Dirección: </strong> {{ data_customer.address }}
                                                                                </p>
                                                                            <div class="card-block table-border-style">
                                                                                <div class="table-responsive">	
                                                                                    <table class="table">
                                                                                        <thead>
                                                                                            <tr >
                                                                                                <th class="quantity both_border">Producto</th>
                                                                                                <th class="description both_border">Código</th>
                                                                                                <th class="price both_border">Precio</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr v-for="raw in data">
                                                                                                <td>{{ raw.products.products_name }}</td>
                                                                                                <td>{{ raw.inventories_codigo }}</td>
                                                                                                <td class="price"> {{ raw.products.discounts_group.length ? (raw.products.products_price - (raw.products.discounts_group[0].discounts[0].discounts_porcentaje*raw.products.products_price)/100) : raw.products.products_price}} </td>
                                                                                            </tr>
                                                                                            
                                                                                            <tr>
                                                                                            
                                                                                                <th class="price totales both_border" colspan=3> TOTAL IMPORTE  $ {{totalPrice}}</th>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                            <p class="centered">Gracias por su compra!<br>www.sumaq.com</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="card">
                                                                        <div class="card-header" style="background: #00000014;">
                                                                            Finalizar Compra
                                                                        </div>
                                                                        <div class="card-body">
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">
                                                                                        <label >Método de Pago</label>
                                                                                        <select name="select" class="form-control form-control-primary" v-model="methodpage">
                                                                                            <option value="efectivo">Efectivo</option>
                                                                                            <option value="tarjeta">Tarjeta</option>
                                                                                        </select>
                                                                                    </div>                                                               
                                                                                </div>
                                                                                <div class="col-md-12">
                                                                                    <div class="border-checkbox-section">
                                                                                        <div
                                                                                            class="border-checkbox-group border-checkbox-group-primary">
                                                                                            <input class="border-checkbox" type="checkbox"
                                                                                                id="checkbox1" v-model="check">
                                                                                            <label class="border-checkbox-label"
                                                                                                for="checkbox1">Aceptar Terminos y Condiciones</label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>                            
                                                                            </div>
                                                                            <div class="form-group" v-if="methodpage=='efectivo'">
                                                                                <template v-if="check==false">
                                                                                    <button class="btn btn-primary" disabled style="background-color: #bfc5c5 !important;">Efectivo</button>
                                                                                </template>
                                                                                <template v-else>
                                                                                    <button class="btn btn-primary" @click="Pagar()">Efectivo</button>
                                                                                </template>
                                                                            </div>

                                                                            <div class="form-group" v-if="methodpage=='tarjeta'">
                                                                                <template v-if="check==false">
                                                                                    <button class="btn btn-primary" disabled style="background-color: #bfc5c5 !important;">Tarjeta</button>
                                                                                </template>
                                                                                <template v-else>
                                                                                    <button class="btn btn-primary">Tarjeta</button>
                                                                                </template>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <button class="btn btn-primary"> <i class="fa fa-print fa-3x"></i></button> <br><br>   
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <button class="btn btn-primary"><i class="fa fa-envelope-o fa-3x"></i></button>
                                                                        </div>
                                                                                                                                            
                                                                    </div>
                                                                </div>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
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
            data:[],
			check:false,
            methodpage:'',
            data_pedidos:this.$route.params.data_pedidos,
            data_customer:this.$route.params.data_customer,
            hoy: new Date(),  
            fecha:'',
            pagar_billete:'',            
            customers_name:'',
            customers_mail:'',
            customers_phone:'',
            address:'',
            addresses_reference:'',
	    }
	},

    computed: {
		totalPrice () {
            var total = 0.0;
			for (var index = 0; index < this.data.length; index++) {
                total = total + (this.data[index].products.products_price - (this.data[index].products.discounts_group[0].discounts[0].discounts_porcentaje*this.data[index].products.products_price)/100);
            }
            return total;
		},
    },


	methods:{

        getPedidos(data_pedidos) {
            let me = this;
            axios
                .post("/get_products_pedidos", { data_pedidos: data_pedidos })
                .then(function (response) {
                    me.data = response.data;
                });
        },

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
				'customers_name' : me.data_customer.customers_name,
                'customers_mail' : me.data_customer.customers_mail,
                'customers_phone' : me.data_customer.customers_phone,
                'address': me.data_customer.address,
                'addresses_reference': me.data_customer.addresses_reference,
                'sales_payment_method' : me.methodpage,
                'sales_payment_date' : me.fecha,
                'data_pedidos' : me.data_pedidos,
                'total_bussines': me.totalPrice,
			}).then(function(response){
                if (response.data.status=='success') {
                    swal.close();
                    JSON.parse(localStorage.getItem('array_pedidos'));
                    localStorage.clear();
                    this.$router.replace('/sales/pedidos');
                }				
          	});
        },

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

        if (localStorage.getItem("array_pedidos")) {
            try {
                //this.data_pedidos = JSON.parse(localStorage.getItem('data_pedidos'));
                this.data_pedidos = JSON.parse(localStorage.getItem("array_pedidos"));
            } catch (e) {
                localStorage.removeItem("array_pedidos");
            }
        };
        self.getPedidos(this.data_pedidos);
    },

  
};
</script>

<style>

.body-ticket{
    font-size: 12px;
    font-family: 'Times New Roman';
}

.both_border {
    border-top: 1px dotted  black;
	border-bottom: 1px dotted  black;
   
}

td.description,
th.description {
    width: 30mm;
    max-width: 30mm;
}

td.quantity,
th.quantity {
    width: 10mm;
    max-width: 10mm;
    word-break: break-all;
	text-align:center;
}

td.price,
th.price {
    width: 20mm;
    max-width: 20mmpx;
    word-break: break-all;
	text-align:right;
}

.centered {
    text-align: center;
    align-content: center;
}

.ticket {
    max-width: 70%;
    background-image: url('/img/star_ticket.png');
    border-radius: 7px;
    margin: 5px;
    padding: 5px;
}

td.totales {
    font-size: 15px;
}


img {
    max-width: inherit;
    width: inherit;
}

@media print {
    .hidden-print,
    .hidden-print * {
        display: none !important;
    }
}


</style>
