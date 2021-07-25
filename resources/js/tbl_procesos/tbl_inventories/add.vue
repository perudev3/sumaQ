<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout" >
	        <div class="row">
				<div class="tg-formtheme tg-formdashboard">
					<fieldset>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div class="tg-dashboardbox">
                                <div class="tg-dashboardholder">
                                    <div class="row">
                                        <div class="col-md-12">
                                                <div class="card">
                                                    <div class="col-lg-6">
                                                        <img :src="'/img_products/'+data_products.products_image_url" />
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="card-header">
                                                            <p><b>{{ data_products.products_name }}</b></p>
                                                            <p><b>Precio - S/ {{data_products.products_price }}</b></p>
                                                        </div>
                                                        <div class="card-body">

                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>                                
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <div class="tg-dashboardbox">
                                <div class="tg-dashboardholder">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="btn btn-primary" @click="create_inputs">+ Agregar</button>
                                        </div> <br><br>
                                        <div class="col-md-12" v-for="(inp, index) in inputs_add">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="">Cantidad</label>
                                                    <input type="text" class="form-control" v-model="inp.cantidad">
                                                </div>   
                                            </div> 
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="">Medidas</label>
                                                    <input type="text" class="form-control" v-model="inp.medidas">
                                                </div>   
                                            </div>    
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label style="margin: 35px;"></label>
                                                    <button class="btn btn-primary" @click="removeOrder(index)">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>                                   
                                        </div>
                                        <div class="footer">
                                            <button class="btn btn-primary" @click="GuardarInventario()">Guardar</button>
                                        </div>
                                    </div>
                                
                                </div>
                            </div>
                        </div>
					</fieldset>
				</div>
	        </div>
		</section>
	</main>
	
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
				me.data_products = response.data.product.products;
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