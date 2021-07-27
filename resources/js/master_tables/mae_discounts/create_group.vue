<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
	          <div class="tg-formtheme tg-formdashboard">
	            <fieldset>
	              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
	                <div class="tg-dashboardbox">
	                  <div class="tg-dashboardholder">
						<table class="table table-responsive tg-dashboardtable tg-payments">
                            <thead>
                                <tr>
                                    <td>Nombre del producto</td>
                                    <td>Precio</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody style="height: 258px;overflow: hidden;overflow-y: scroll;">
                                <tr v-for="(data, index) in data_products">
                                    <td>{{data.products_name}}</td>
                                    <td>$ {{data.products_price}} </td>
                                    <td> <input type="checkbox"  
												v-model="check" 
												class="form-control" 
												:value="data.products_id" 
												:id="data.products_id"
												@click="Checked($event)"
												style="width: 19px;"></td>
                                </tr>
                            </tbody>
                        </table>
	                  </div>

	                </div>
	              </div>
				  <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
					<div class="tg-dashboardbox">
						<div class="card-header tg-dashboardboxtitle">
						<h2>Creación del Grupo</h2>
						</div>
						<div class="card-body tg-dashboardholder">
						<div>
							<label>Nombre del Grupo</label>
							<input type="text" class="form-control" v-model="group_discounts_name">
						</div>
						<div class="form-group">
							<label>Seleccione Descuento</label>
							<select class="form-control" v-model="discounts_id">
								<option v-for="data in data_discounts" :value="data.discounts_id">{{ data.discounts_name }}</option>
							</select>
						</div>
						<div class="form-group">
							<label>Seleccione Categoria</label>
							<select class="form-control" v-model="categories_id">
								<option v-for="data in data_categories" :value="data.categories_id">{{ data.categories_name }}</option>
							</select>
						</div>
						<div class="form-group">
							<label>Seleccione Coleccion</label>
							<select class="form-control" v-model="collections_id" @change="ListProducts()">
								<option v-for="data in data_collections" :value="data.collections_id" >{{ data.collections_name }}</option>
							</select>
						</div>
						<div class="form-group">
							<button class="btn btn-primary" type="button" @click="CrearGroupDiscount()">Registrar</button>
							<router-link to="/discount">
								<button class="btn btn-warning" type="button">Cancelar</button>
							</router-link>
							
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

import Autocomplete from '@trevoreyre/autocomplete-vue';
import '@trevoreyre/autocomplete-vue/dist/style.css'

export default {

	components: {
        Autocomplete
    },

  	data:function(){
      return {
        data_discounts:[],
		data_categories:[],
		data_collections:[],
		data_products:[],
		check:[],
		group_discounts_name:'',
		discounts_id:'',
		categories_id:'',
		collections_id:'',
        neworder: null,
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
			  	GetDescounts(){
					  let me = this;
				  	axios.get('/get_discount').then(function(response){
                		me.data_discounts = response.data;
          			});
			  	},

				GetCategories(){
					let me = this;
				  	axios.get('/get_categories').then(function(response){
                		me.data_categories = response.data;
          			});
			  	},


				GetCollections(){
					let me = this;
				  	axios.get('/get_collection').then(function(response){
                		me.data_collections = response.data;
					});
			  	},

				ListProducts(){
					let me = this;
					Swal.fire({
						title: 'Cargando...',
						allowEscapeKey: false,
						allowOutsideClick: false,
						onOpen: () => {
						swal.showLoading();
						}
					});
				  	axios.post('/get_list_products',{
						  'categories_id': this.categories_id,
						  'collections_id': this.collections_id
					  }).then(function(response){
                		me.data_products = response.data;
						swal.close();
          			});
			  	},

				Checked(e){
					if (e.target.checked) {
						this.button_status=1;
					}else{
						this.button_status=0;
					}
				},

				CrearGroupDiscount(){
					let me = this;
					axios.post('/create_groupdiscounts',{
						  'group_discounts_name': this.group_discounts_name,
						  'discounts_id':this.discounts_id,
						  'categories_id': this.categories_id,
						  'collections_id': this.collections_id,
						  'data_listproducts':this.check
					}).then(function(response){
						if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Grupo Creado',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            me.$router.replace('/discount');
                        };
          			});
				}
			
  		},

		mounted(){
			let me = this;
			me.GetDescounts();
			me.GetCategories();
			me.GetCollections();
		}
};
</script>