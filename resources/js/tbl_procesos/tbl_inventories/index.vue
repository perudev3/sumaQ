<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
			  <div class="col-md-6">
				  <input type="text" class="form-control" placeholder="Digite el nombre del producto">
			  </div>
			  <div class="col-md-6">
				  <button class="btn btn-primary">Filtrar Busqueda</button>
			  </div>
	      </div>
		</section>
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
				<div class="tg-formtheme tg-formdashboard">
					<fieldset>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-dashboardbox">
						<div class="tg-dashboardholder">
							<div class="row">
								<div class="col-md-6" v-for="data in data_inventarios" :key="data.id" 
								style="border: 1px solid;padding-bottom: 13px;padding-top: 9px;">
										<div class="card">
											<div class="col-lg-6">
												<img :src="'/img_products/'+data.products_image_url" />
											</div>
											<div class="col-lg-6">
												<div class="card-header">
													<p><b>{{ data.products_name }}</b></p>
													<p><b>{{data.category.categories_name }}</b></p>
													<p>Inventario :{{ data.count_inventory.length }} </p>
												</div>
												<div class="card-body">

												</div>
											</div>
										</div>
										<div class="card-footer">	
											<router-link :to="`/inventory/add/${data.products_id}`">										
												<button class="btn btn-primary">+ Agregar inventario</button> 
											</router-link>
											<router-link :to="`/inventory/details/${data.products_id}`">
												<button class="btn btn-primary">Ver inventario</button>
											</router-link>			
											<a :href="'/generate_qr_inventorie/'+data.products_id" target="_blank">
												<button class="btn btn-primary">Generar QR <i class="fa fa-qrcode"></i> </button>
											</a>
										</div>
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
      	data_inventarios:[],
		count:null,
      }
  },


  methods:{

		GetProductos(){
              let me=this;
              axios.get('/get_inventario').then(function(response){
                me.data_inventarios = response.data;
                console.log(me.data_inventarios);
          });
        },

  },

   mounted() {
            let self = this
            setTimeout(function(){
			  self.GetProductos();
            },2000);

  }

  
};
</script>