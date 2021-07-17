<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
				<div class="tg-formtheme tg-formdashboard">
					<fieldset>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-dashboardbox">
						<div class="tg-dashboardholder">
							<div class="row">
								<div class="col-md-6" v-for="data in data_inventarios.inventory" :key="data.id">
										<div class="card">
											<div class="col-lg-6">
												<img :src="'/img_products/'+data.products.products_image_url" />
											</div>
											<div class="col-lg-6">
												<div class="card-header">
													<p>{{ data.products.products_name }}</p>
													<p>Inventario :{{ data_inventarios.packages }} </p>
												</div>
												<div class="card-body">

												</div>
											</div>
										</div>
								</div>
							</div>
									
							<!-- <table id="tg-adstype" class="table table-responsive tg-dashboardtable tg-payments">
							<thead>
								<tr>
								<th>Nombre</th>
								<th>Sucursal</th>
								<th>Imagen</th>
								<th>Codigo de Inventario</th>
								<th>Usuario</th>
								<th>Opciones</th>
								</tr>
							</thead>
							<tbody>
								<tr data-category="packageone" v-for="(data, index) in searchInUsers">
								<td data-title="Nombre">
									<h3>{{data.products_name}}</h3>
								</td>
								<td data-title="Sucursal">
									<h3>{{data.sucursals_name}}</h3>
								</td>
								<td data-title="Imagen">
									<img :src="data.inventories_image_url ? '/img_inventories/'+data.inventories_image_url : '/img/logo.jpeg'"  style="width: 50%;"/>
								</td>
								<td data-title="Codigo de Inventario">
									<h3>{{data.inventories_codigo}}</h3>
								</td>
								<td data-title="Usuario">
									<h3>{{data.name}}</h3>
								</td>
								<td data-title="Opciones">
									<div class="tg-btnsactions">
									<a class="tg-btnaction tg-btnactionview" target="_blank" :href="'/generate_qr_inventorie/'+data.inventories_codigo"><i class="fa fa-qrcode fa-2x"></i></a>
									<a class="tg-btnaction tg-btnactionview" href="javascript:void(0);"><i class="fa fa-pencil fa-2x"></i></a>
									<a class="tg-btnaction tg-btnactiondelete" href="javascript:void(0);"><i class="fa fa-trash fa-2x"></i></a>
									</div>
								</td>
								</tr>
							</tbody>
							</table>

							<div class="card-footer" style="background-color: rgb(0 0 0 / 0%) !important;border-top: 1px solid rgb(255 255 255 / 13%) !important;">
								<nav aria-label="Page navigation" class="float-left">
									<ul class="pagination">
										<li v-if="pagination.currentPage == 1" class="page-item disabled">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true"><i class="fa fa-fast-backward"></i></span>
												<span class="sr-only">Previous</span>
											</a>
										</li>
										<li v-else class="page-item">
											<a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(1)">
												<span aria-hidden="true"><i class="fa fa-fast-backward"></i></span>
												<span class="sr-only">Previous</span>
											</a>
										</li>


										<li v-if="pagination.currentPage == 1" class="page-item disabled">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true"><i class="fa fa-step-backward"></i></span>
												<span class="sr-only">Previous</span>
											</a>
										</li>
										<li v-else class="page-item">
											<a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(pagination.currentPage - 1)">
												<span aria-hidden="true"><i class="fa fa-step-backward"></i></span>
												<span class="sr-only">Previous</span>
											</a>
										</li>

										<li v-for="(page,index) in getLinksPages" class="page-item" :class="[page === isCurrentPage ? 'active':'' ]">
											<span v-if="page === isCurrentPage" class="page-link">{{ page }}</span>
											<a v-else class="page-link" href="#" @click.prevent="changePage(page)" >{{page}}</a>
										</li>

										<li v-if="pagination.currentPage == pagination.lastPage" class="page-item disabled">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true"><i class="fa fa-step-forward"></i></span>
												<span class="sr-only">Next</span>
											</a>
										</li>
										<li v-else class="page-item">
											<a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.currentPage + 1)">
												<span aria-hidden="true"><i class="fa fa-step-forward"></i></span>
												<span class="sr-only">Next</span>
											</a>
										</li>

										<li v-if="pagination.currentPage == pagination.lastPage" class="page-item disabled">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true"><i class="fa fa-fast-forward"></i></i></span>
												<span class="sr-only">Next</span>
											</a>
										</li>
										<li v-else class="page-item">
											<a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.lastPage)">
												<span aria-hidden="true"><i class="fa fa-fast-forward"></i></i></span>
												<span class="sr-only">Next</span>
											</a>
										</li>
									</ul>
								</nav>
							</div> -->
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