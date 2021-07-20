<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
        <div class="tg-formtheme tg-formdashboard">
          <fieldset>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
              <div class="tg-dashboardbox">
                <div class="tg-dashboardboxtitle">
                  <h2>Registrar Productos</h2>
                </div>
                <div class="tg-dashboardholder">
                    <div class="form-group">
                        <vue2Dropzone ref="products_image_url" id="dropzone"
                            v-on:vdropzone-max-files-exceeded="maxFilesAlert"
                            :options="dropzoneOptions">
                        </vue2Dropzone>
                  </div>
                  <div class="form-group">
                      <input type="text"  v-model="products_name" class="form-control" placeholder="Nombre del Producto">
                  </div>
                  <div class="form-group">
                      <textarea  v-model="products_caracts" class="form-control" placeholder="Caracteristicas del Producto"></textarea>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="category_id">
                         <option v-for="datacategory in data_category" :key="datacategory.categories_id" :value="datacategory.categories_id">{{datacategory.categories_name}}</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="collection_id">
                         <option v-for="datacollections in data_collection" :key="datacollections.collections_id" :value="datacollections.collections_id">{{datacollections.collections_name}}</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="material_id">
                         <option v-for="data in data_material" :key="data.material_id" :value="data.material_id">{{data.materials_name}}</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="products_is_active">
                         <option value="1">Ativo</option>
                         <option value="0">Inactivo</option>
                     </select>
                  </div>
                  <div class="form-group">
                      <input v-model="products_price" class="form-control" placeholder="Precio del Producto"/>
                  </div>
                  <div class="form-group">
                      <button class="btn btn-primary" type="button" @click="PostProducts">Registrar</button>                      
                      <router-link to="/products">
                        <button class="btn btn-warning" type="button">Cancelar</button>
                      </router-link>                      
                  </div>
                </div>
              </div>
            </div>
          </fieldset>
        </div>
		</section>
	</main>
	
</template>


<script>

import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

export default {

  components: {
       vue2Dropzone
  },

  data:function(){
      return {
        data_category:[],
        data_collection:[],
        data_material:[],
        
        products_name:'',
        collection_id:'',
        category_id:'',
        material_id:'',
        products_caracts:'',
        products_price:'',
        products_net_price:'',
        products_is_active:'',
        products_image_url:'',

        dropzoneOptions: {
                    url: 'empresa/producto',
                    thumbnailWidth: 150,
                    maxFilesize: 1.5,
                    addRemoveLinks : true,
                    autoProcessQueue:false,
                    headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    maxFiles:1,
                    uploadMultiple: true,
        },

      }
  },


  methods:{

        maxFilesAlert(file){
                Swal.fire({
                    title: 'No permitido',
                    text: 'Solo se permiten 1 archivos',
                    type: 'error',
                    confirmButtonText: 'OK'
                })
               this.$refs.categories_image_url.removeFile(file);
        },

        GetCategories(){
              let me=this;
              axios.get('/get_categories').then(function(response){
                me.data_category = response.data;
          });
        },

        GetCollections(){
              let me=this;
              axios.get('/get_collection').then(function(response){
                me.data_collection = response.data;
          });
        },


        GetMaterials(){
              let me=this;
              axios.get('/get_material').then(function(response){
                me.data_material = response.data;
          });
        },

        PostProducts(){
                this.$refs.products_image_url.processQueue();
                let images  = this.$refs.products_image_url.getAcceptedFiles();
                let index = 0;
                let files  = []
                let  data = new FormData()

                for( let i = 0; i < images.length; i++ ){
                    let file = images[i];
                    data.append('products_image_url[' + i + ']', file);
                }

                data.append("products_name", this.products_name)
                data.append("collections_id", this.collection_id)
                data.append("category_id", this.category_id)
                data.append("materials_id", this.material_id)
                data.append("products_caracts", this.products_caracts)
                data.append("products_price", this.products_price)
                data.append("products_is_active", this.products_is_active)
                axios.post('/post_products', data,{ headers: {'Content-Type': 'multipart/form-data'}})
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Producto Registrada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/products');
                        }else{
                            Swal.fire({
                              title: response.data.message,
                              text: 'Error al registrar Producto',
                              type: 'success',
                              confirmButtonText: 'OK'
                            })
                        };
                }).catch(function (error) {
                    console.log(error);
                });
        },

  },


  mounted() {
            let self = this
            setTimeout(function(){
                self.GetCategories();
                self.GetCollections();
                self.GetMaterials();
            },2000);

  }
  
};
</script>