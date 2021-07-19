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
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Cantidad</label>
                                                    <input type="text" class="form-control" v-model="cantidad">
                                                </div>   
                                            </div>  
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="">Medidas</label>
                                                    <input type="text" class="form-control" v-model="medidas">
                                                </div>   
                                            </div>                                      
                                        </div>
                                        <div>
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
			products_id: this.$route.params.products_id,
            cantidad:'',
            medidas:'',
        }
    },


    methods:{

        GuardarInventario(){
                let me=this;
                axios.post('/inventory_add',{
                    'cantidad': me.cantidad,
                    'medidas': me.medidas,
                    'products_id': me.products_id,
                }).then(function(response){
                if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Exito al aumentar inventario',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            me.$router.replace('/inventory');
                        };
                });
        },

    },
  
};
</script>