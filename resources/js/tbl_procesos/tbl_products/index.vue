<template>

	<div class="pcoded-content">
        <div class="pcoded-inner-content">
            <!-- Main-body start -->
            <div class="main-body">
                <div class="page-wrapper">
                    <!-- Page-header start -->
                    <div class="page-header">
                        <div class="row align-items-end">
                            <div class="col-lg-3">
                            	<div class="page-header-title">
                                    <div class="d-inline">
                                        <h4>PRODUCTOS</h4>
                                    </div>
                            	</div>
                            </div>
							<div class="col-lg-8">
								<div class="page-header-breadcrumb">
									<div class="col-lg-7">
										<input type="text" class="form-control" placeholder="Digite el nombre del producto"  v-model="products_name">
									</div>
									<div class="col-lg-3">
										<button class="btn btn-primary" @click="searchProducts()"><i class="fa fa-search"></i> Buscar</button>
									</div>
									<div class="col-lg-4">
										<router-link to="/products/create">
											<button class="btn btn-primary">
												+ Nuevo Producto
											</button>
										</router-link>
									</div>										
								</div>
								
							</div>
                        </div>
                    </div>
                    <!-- Page-header end -->

                    <!-- Page-body start -->
                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">
								<div class="card">
									<div class="card-block">
										<div class="row">
											<div class="col-lg-4" v-for="(data, index) in searchInUsers">
												
                                                <div class="card-sub" align="center">
													<div class="alert alert-danger background-danger">
														<span v-if="data.count_inventory.length < 500">Se agota Stock de este producto</span>
													</div>
                                                    <img class="card-img-top img-fluid"
                                                        :src="'/img_products/'+data.products_image_url" 
                                                        alt="Card image cap"
														style="width: 28%;">
                                                    <div class="card-block">
														<b>{{ data.products_name }}</b>
                                                    </div>
													<div class="card-body">
														<div class="alert alert-success background-success">
															<b>Detalles del Producto</b>
														</div>
														<template v-if="data.discounts_group.length">
															<p><h5>Precio - <b><del> $ {{ data.products_price }}</del></b></h5></p>
															<p><h5>Precio + Descuento - <b> $ {{ data.discounts_group.length ?  (data.products_price - (data.discounts_group[0].discounts[0].discounts_porcentaje*data.products_price)/100) : 'No tiene descuento'}} </b> </h5> </p>
														</template>		
														<template v-else>
															<p><h5>Precio - <b>{{ data.products_price }}</b></h5></p>
														</template>		
														<p><h5>Descuento del <b> {{data.discounts_group[0].discounts[0].discounts_porcentaje}} %</b></h5></p>
													</div>
                                                </div>
												<div class="card-footer" align="center">	
													<button class="btn btn-primary" @click="editProducto(data)">Editar <i class="fa fa-pencil fa-1x"></i></button>
													<button class="btn btn-primary">Eliminar <i class="fa fa-trash fa-1x"></i></button>
												</div>
                                            </div>
										</div>
									</div>
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
		</div>
	</div>
	
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

		//Pagination//
        GetProductos(){
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

		changePage(page){
            this.pagination.perPage=this.selectPerPage;
            this.pagination.currentPage = Number(page);
        },

        onKeySearch(){
            this.changePage(1);
        },
        //End Paginate//

        
		searchProducts(){
          let me=this;
          axios.get('/products/search_products',{
			 'products_name': me.products_name
		}).then(function(response){              
			  if (response.data.length) {
				  me.data_products=response.data;
			  }else{
				Swal.fire({
                    text: 'Producto no encontrado',
                    type: 'success',
                    confirmButtonText: 'OK'
                });
			  }
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

  computed:{
		getCurrentUsers(){
			this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
			this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
			return this.data_products.slice(this.pagination.from,this.pagination.to);
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
				this.pagination.total = me.data_products.filter((prod) => prod.products_name.toLowerCase().includes(this.search.toLowerCase())).length;
			}else{
				this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
				this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
				this.pagination.total = me.data_products.length;
			}
			return me.data_products.filter((prod) => prod.products_name.toLowerCase().includes(this.search.toLowerCase())).slice(this.pagination.from,this.pagination.to);
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