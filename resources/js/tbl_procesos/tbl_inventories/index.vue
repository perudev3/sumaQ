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
								<div class="col-md-6" v-for="(data, index) in searchInUsers" style="padding-bottom: 13px;padding-top: 9px;">
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
										</div> <br><br><br><br><br>										
										<div class="card-footer">	
											<router-link :to="`/inventory/add/${data.products_id}`">										
												<button class="btn btn-primary">+ inventario</button> 
											</router-link>
											<router-link :to="`/inventory/details/${data.products_id}`">
												<button class="btn btn-primary"  :disabled="data.count_inventory.length==[]">Ver</button>
											</router-link>			
											<a :href="'/generate_qr_inventorie/'+data.products_id" target="_blank">
												<button class="btn btn-primary">Gen. QR <i class="fa fa-qrcode"></i> </button>
											</a>
										</div>
								</div>
							</div>
							<div class="row">
								<div class="card-footer" style="background-color: rgb(0 0 0 / 0%) !important;border-top: 1px solid rgb(255 255 255 / 13%) !important;">
									<nav aria-label="Page navigation" class="float-left">
										<ul class="pagination">
										<!--Botones anteriores-->
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
										<!--Botones anteriores-->

											<li v-for="(page,index) in getLinksPages" class="page-item" :class="[page === isCurrentPage ? 'active':'' ]">
												<span v-if="page === isCurrentPage" class="page-link">{{ page }}</span>
												<a v-else class="page-link" href="#" @click.prevent="changePage(page)" >{{page}}</a>
											</li>

										<!--Botones posteriores-->
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
										<!--Botones posteriores-->  
										</ul>
									</nav>
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

		//Pagination//
		GetProductos(){
              let me=this;
              axios.get('/get_inventario').then(function(response){
                me.data_inventarios = response.data;
                console.log(me.data_inventarios);
          });
        },

		changePage(page){
            this.pagination.perPage=this.selectPerPage;
            this.pagination.currentPage = Number(page);
        },

        onKeySearch(){
            this.changePage(1);
        },
        //End Paginate//

  },

	computed:{
		getCurrentUsers(){
			this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
			this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
			return this.data_inventarios.slice(this.pagination.from,this.pagination.to);
		},
		getLinksPages(){
			let cant = this.pagination.total / Number(this.pagination.perPage);
			this.pagination.links=[];
			let cumstom_links=[];
			/*obtiene los numeros de todas las paginas*/
			for ( let i=0 ; i <  cant; i++) {
				this.pagination.links.push(i+1);
			}
			this.pagination.lastPage = this.pagination.links.length;
			let start = 0;
			let limit = 5;
			if (this.pagination.currentPage < 3) {
				start = 0;
				return this.pagination.links.slice(start,limit);
			}else if (this.pagination.currentPage >= 3 && this.pagination.currentPage-1+2 < this.pagination.lastPage){
				start=(this.pagination.currentPage-1)-2;
				limit = start+limit;
				return this.pagination.links.slice(start,limit);
			}else{
				if (this.pagination.links.length == 4) {
					start=0;
					limit = start+limit;
					return this.pagination.links.slice(start,limit);    
				}else{
					start=(this.pagination.lastPage-1)-4;
					limit = start+limit;
					return this.pagination.links.slice(start,limit);
				}
			}
					
		},
		isCurrentPage(){
			return this.pagination.currentPage;
		},
		searchInUsers(){
			let me =this;

			/*me.data_inventarios.filter(function(element){ 
				console.log(element.products_name.toLowerCase());
			});*/
			if (this.search.length > 0){
				this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
				this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
				this.pagination.total = me.data_inventarios.filter((inv) => inv.products_name.toLowerCase().includes(this.search.toLowerCase())).length;
			}else{
				this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
				this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
				this.pagination.total = me.data_inventarios.length;
			}
			return me.data_inventarios.filter((inv) => inv.products_name.toLowerCase().includes(this.search.toLowerCase())).slice(this.pagination.from,this.pagination.to);
		}
	},

   mounted() {
            let self = this
            setTimeout(function(){
			  self.GetProductos();
            },2000);

  }

  
};
</script>