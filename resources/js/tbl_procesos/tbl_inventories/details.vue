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
                                        <h4>DETALLES DEL INVENTARIO</h4>
                                    </div>
                            	</div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->

                    <!-- Page-body start -->
                    <div class="page-body">
                        <div class="row">
							<div class="col-sm-6">
								<div class=" ">
									<div class="card-block">
										<div class="row">
											<div class="col-lg-12">
                                                <div class="card-sub" align="center">
                                                    <div class="alert alert-warning background-warning">
														{{ data_products.products_name }}   
													</div>
                                                    <img class="card-img-top img-fluid"
                                                        :src="'/img_products/'+data_products.products_image_url" 
                                                        alt="Card image cap"
														style="width: 20%;">    
													<div class="card-body">
														<div class="alert alert-success background-success">
															<b>Detalles del Producto</b>
														</div>													
														<p><h5>Precio - <b>$ {{data_products.products_price }}</b> </h5> </p>
														<p><h5>Categoria - <b>{{data_products.category.categories_name}}</b> </h5> </p>
													</div>
                                                </div>
                                            </div>
										</div>
									</div>
								</div>
							</div>  
							<div class="col-sm-12">
								<div class=" ">
                                    <div class="card-block">
                                        <div class="card-block table-border-style">
                                            <div class="dt-responsive table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
															<th>Producto</th>
															<th>Estado</th>
															<th>Imagen</th>
															<th>Material</th>
															<th>Coleccion</th>
															<th>Tamaño</th>
															<th>Codigo</th>
															<th>Generar QR</th>
															<th>Opciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="(data, index) in searchInUsers">															
															<td>
																{{data.products.products_name}}
															</td>
															<td>
																<span v-if="data.sales_id || data.layaway_id" style="background: #008000a8;padding: 3px;border-radius: 4px;color: #fff;"> Vendido </span>
															</td>
															<td>
																<img style="width: 120px;" :src="data.inventories_image_url ? '/img_inventories/'+data.inventories_image_url : '/img/logo.jpeg'">
															</td>
															
															<td>
																{{data.products.material.materials_name}}
															</td>
															<td>
																{{data.products.collection.collections_name}}
															</td>
															<td>
																{{data.sizes ? data.sizes.medidas: 'No tiene medidas'  }}
															</td>
															<td>
																{{data.inventories_codigo}}
															</td>
															<td>
																<a :href="'/generate_qr_byinventorie/'+data.inventories_codigo" target="_blank">
																	<button class="btn btn-primary">
																		Generar QR
																	</button>
																</a>
															</td>
															<td>
																<a ><button class="btn btn-danger"> <i class="feather icon-trash"></i></button></a>
																<label class="custom-file-upload" @click="Input(data.inventories_codigo)">
																	<i class="feather icon-cloud-upload"></i> Subir Imagen
																</label>
																<input  type="file" :data-id="data.inventories_codigo" @change="UploadImageInventorie($event)"/>
															</td>
                                                        </tr>

                                                    </tbody>
                                                    <tfoot>
                                                        <div class="card-footer" style="background-color: rgb(0 0 0 / 0%) !important;border-top: 1px solid rgb(255 255 255 / 13%) !important;">
                                                            <nav aria-label="Page navigation" class="float-left">
                                                                                <ul class="pagination">
                                                                                <!--Botones anteriores-->
                                                                                    <li v-if="pagination.currentPage == 1" class="page-item disabled">
                                                                                        <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-left"></i></span>
                                                                                            <span class="sr-only">Previous</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(1)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-left"></i></span>
                                                                                            <span class="sr-only">Previous</span>
                                                                                        </a>
                                                                                    </li>


                                                                                    <li v-if="pagination.currentPage == 1" class="page-item disabled">
                                                                                        <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-left"></i></span>
                                                                                            <span class="sr-only">Previous</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(pagination.currentPage - 1)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-left"></i></span>
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
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-right"></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.currentPage + 1)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-right"></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>

                                                                                    <li v-if="pagination.currentPage == pagination.lastPage" class="page-item disabled">
                                                                                        <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-right"></i></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.lastPage)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-right"></i></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>
                                                                                <!--Botones posteriores-->  
                                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </tfoot>
                                                </table>
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
      		data_inventory:[],
			data_products:[],
			products_id: this.$route.params.products_id,
			inventories_codigo:'',
			selectPerPage:6,
			search:'',
			pagination:{
				perPage:6,
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
        getDetailsInventory(){
              let me=this;
              axios.get('/inventory_details/'+me.products_id).then(function(response){
                me.data_inventory = response.data.lista;
				me.data_products = response.data.product;
                console.log(me.data_inventory, me.data_products);
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

		Input(codigo){
			$("input[data-id='" +codigo+ "']").trigger('click');
			this.inventories_codigo = codigo;
			
		},

		UploadImageInventorie(event){
				let me = this;
                var data = new FormData()

                data.append("inventories_image_url", event.target.files[0])
				data.append("inventories_codigo", this.inventories_codigo)
                axios.post('/uploadimage_inventorie', data).then(function (response) {
                	Swal.fire({
                      title: response.data.message,
                      text: 'Imagen subido exitosamente!!',
                      type: 'success',
                      confirmButtonText: 'OK'
                    });
					me.getDetailsInventory();
                }).catch(function (error) {
                    console.log(error);
                });

		}

  },

  computed:{
		getCurrentUsers(){
			this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
			this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
			return this.data_inventory.slice(this.pagination.from,this.pagination.to);
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
				this.pagination.total = me.data_inventory.filter((inv) => inv.inventories_codigo.toLowerCase().includes(this.search.toLowerCase())).length;
			}else{
				this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
				this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
				this.pagination.total = me.data_inventory.length;
			}
			return me.data_inventory.filter((inv) => inv.inventories_codigo.toLowerCase().includes(this.search.toLowerCase())).slice(this.pagination.from,this.pagination.to);
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

<style scoped>
input[type="file"] {
    display: none;
}
.custom-file-upload {
    border: 1px solid #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
}

.marcado{
	background: #ea8a8a;
}

::-webkit-scrollbar {
    width: 12px;
	height: 12px;
}
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgb(0 0 0 / 1%);
    border-radius: 10px;
}
::-webkit-scrollbar-thumb {
    border-radius: 22px;
    -webkit-box-shadow: inset 0 0 6px rgb(0 0 0 / 46%);
}
</style>