<template>

	<div class="pcoded-content">
        <div class="pcoded-inner-content">
            <!-- Main-body start -->
            <div class="main-body">
                <div class="page-wrapper">
                    <!-- Page-header start -->
                    <div class="page-header">
                        <div class="row align-items-end">
                            <div class="col-lg-8">
                            	<div class="page-header-title">
                                    <div class="d-inline">
                                        <h4>Inventario</h4>
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
													<div class="alert alert-warning background-warning">
														{{ data.products_name }}   
													</div>
                                                    <img class="card-img-top img-fluid"
                                                        :src="'/img_products/'+data.products_image_url" 
                                                        alt="Card image cap"
														style="width: 28%;">
													<div class="card-body">
														<div class="alert alert-success background-success">
															<b>Detalles del Producto</b>
														</div>
														<p><h5> Categoria : <b>{{ data.category.categories_name }}</b></h5> </p>	
														<p><h5> Stock : <b>{{ data.count_inventory.length }}</b></h5> </p>
													</div>
                                                </div>
												<div class="card-footer" align="center">	
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