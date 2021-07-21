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
										<th>Imagen</th>
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
										<tr data-category="packageone" v-for="(data, index) in data_inventory">
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
											{{data.sizes.medidas }}
										</td>
										<td>
											<h3>{{data.inventories_codigo}}</h3>
										</td>
										<td>
											<a :href="'/generate_qr_byinventorie/'+data.inventories_codigo" target="_blank">Generar QR</a>
										</td>
										<td data-title="Action">
											<div class="tg-btnsactions">
												<a class="tg-btnaction tg-btnactionview" ><i class="fa fa-pencil"></i></a>
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

		Input(codigo){
			$("input[data-id='" +codigo+ "']").trigger('click');
			this.inventories_codigo = codigo;
			
		},

		UploadImageInventorie(event){
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
					this.getDetailsInventory();
                }).catch(function (error) {
                    console.log(error);
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