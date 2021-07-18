<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
				<div class="col-md-6">
					<input type="text" class="form-control" placeholder="Digite el nombre del producto">
				</div>
				<div class="col-md-3">
					<button class="btn btn-primary">Filtrar Busqueda</button>
				</div>
				<div class="col-md-3">
					<router-link to="/products/create">
						<button class="btn btn-primary">
							+ Nuevo Producto
						</button>
					</router-link>
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
								<div class="col-md-6" v-for="data in data_products" >
										<div class="card">
											<div class="col-lg-6">
												<img :src="'/img_products/'+data.products_image_url" />
											</div>
											<div class="col-lg-6">
												<div class="card-header">
													<p><b>{{ data.products_name }}</b></p>
													<p><b>Precio - S/ {{data.products_price }}</b></p>
													<p>Descuento - S/ {{ data.discounts_group ? (data.discounts_group[0].discounts[0].discounts_porcentaje*data.products_price)/100 : 'No tiene descuento'}}</p>
												</div>
												<div class="card-body">

												</div>
											</div>
										</div>
										<div class="card-footer">
											<button class="btn btn-primary">Editar <i class="fa fa-pencil fa-1x"></i></button>
											<button class="btn btn-primary">Eliminar <i class="fa fa-trash fa-1x"></i></button>
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
      	data_products:[],
		  products_name:'',
        selectPerPage:10,
        search:'',
        pagination:{
          perPage:10,
          total:0,
          currentPage:1,
          from:0,
          to:0,
          lastPage:0,
          currentUsers:[],
          links:[]
        },

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
              axios.get('/get_products').then(function(response){
                me.data_products = response.data;
				swal.close();
                console.log(me.data_products);
          });
        },

        
		searchProducts(){
          let me=this;
          axios.get('/products/search_products?products_name='+ me.products_name).then(function(response){
              me.data_products=response.data;
          })
		},
		
		editProducto(data){
			this.$router.push({
				name: "products/edit",
				params:{
					data_product: data
				}
			});
		}

  },

   mounted() {
            let self = this
            setTimeout(function(){
              self.getDetailsInventory();
            },2000);

  }

  
};
</script>