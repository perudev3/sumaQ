<template>
	

	<main id="tg-main" class="tg-main tg-haslayout">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
	      	<ul class="nav nav-pills nav-wizard">
			    <li class="active" style="width: 35%;"><a>Pedidos</a></li>
			    <li style="width: 35%;" @click="Compra"><a>Compra</a></li>
			    <li style="width: 30%;"><a>Pago</a></li>
			</ul>
			<div class="row" style="padding-top: 2%;">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
	              <div class="tg-dashboardbox">
	                <div class="tg-dashboardholder">
						<div class="form-group">
							<label>Imagen del Producto</label>
							<img :src="data_products.inventories_image_url ? '/img_inventories/'+data_products.inventories_image_url : '/img/logo.jpeg'" />
						</div>
						<div class="form-group">
							<label>Nombre del  Producto</label>
							<input type="text"  class="form-control" :value="data_products.products_name" disabled>
						</div>

						<div class="form-group">
							<label>Precio</label>
							<input type="text"  class="form-control" :value="data_products.products_price" disabled>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-primary" @click="Agregar_Pedido(data_products.products_id)">
								Agregar a Carrito
							</button>
						</div>
	                </div>
	              </div>
	            </div>
	            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
	              <div class="tg-dashboardbox">
	                <div class="tg-dashboardholder">
	                  <div class="form-group">
	                      	<qrcode-stream @decode="onDecode">
	                        </qrcode-stream>
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

		Agregar_Pedido(id_inventorie){
			this.neworder = id_inventorie;
            if(!this.neworder) return;
            this.array_pedidos.push(this.neworder);
            this.neworder = '';
            this.saveOrder();
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
			this.$router.push({name: "compra", params: {array_pedidos: this.array_pedidos}})
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