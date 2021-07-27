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
												<img :src="'/img_products/'+data_products.products_image_url"  style="width: 53%;"/>
											</div>
											<div class="col-lg-6">
												<div class="card-header">
													<p><b>{{ data_products.products_name }}</b></p>
													<p>Precio - <b>$ {{data_products.products_price }}</b></p>
													<p>Categoria - <b>{{data_products.category.categories_name}}</b></p>
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
					</fieldset>
				</div>
	      </div>
		</section>
		<section class="tg-dbsectionspace tg-haslayout" >
	      <div class="row">
				<div class="tg-formtheme tg-formdashboard">
					<fieldset>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tg-dashboardbox">
							<div class="tg-dashboardholder">
								<div class="row">
									<table id="tg-adstype" class="table tg-dashboardtable tg-payments">
									<thead>
										<tr>
											<th style="width: 18%;">Imagen</th>
											<th>Nombre</th>
											<th>Categoria</th>
											<th>Material</th>
											<th>Coleccion</th>
											<th>Tamaño</th>
											<th>Codigo</th>
											<th>Generar QR</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr data-category="packageone" v-for="(data, index) in searchInUsers">
										<td>
											<img :src="data.inventories_image_url ? '/img_inventories/'+data.inventories_image_url : '/img/logo.jpeg'" style="width: 70%;">
										</td>
										<td data-title="Nombre">
											<h3>{{data.products.products_name}}</h3>
										</td>
										<td>
											<h3>{{data.products.category.categories_name }}</h3>
										</td>
										<td>
											<h3>{{data.products.material.materials_name}}</h3>
										</td>
										<td>
											<h3>{{data.products.collection.collections_name}}</h3>
										</td>
										<td>
											{{data.sizes ? data.sizes.medidas: 'No tiene medidas'  }}
										</td>
										<td>
											<h3>{{data.inventories_codigo}}</h3>
										</td>
										<td>
											<a :href="'/generate_qr_byinventorie/'+data.inventories_codigo" target="_blank">
												<button class="btn btn-primary">
													Generar QR
												</button>
											</a>
										</td>
										<td data-title="Action">
											<div class="tg-btnsactions">
												<a class="tg-btnaction tg-btnactiondelete" ><i class="fa fa-trash"></i></a>
												<label class="custom-file-upload" @click="Input(data.inventories_codigo)">
													<i class="fa fa-cloud-upload"></i> Subir Imagen
												</label>
												<input  type="file" :data-id="data.inventories_codigo" @change="UploadImageInventorie($event)"/>
											</div>
										</td>
										</tr>
									</tbody>
									</table>
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
      		data_inventory:[],
			data_products:[],
			products_id: this.$route.params.products_id,
			inventories_codigo:'',
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
				me.data_products = response.data.product;
				swal.close();
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
</style>