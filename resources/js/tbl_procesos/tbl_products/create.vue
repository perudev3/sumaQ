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
                                  <h4>REGISTRAR PRODUCTO</h4>                                                        
                              </div>
                          </div>
                        </div>
                    </div>
                </div>

                <div class="page-body">
                  <div class="row">
                      <div class="col-sm-12">
                          <!-- Basic Form Inputs card start -->
                          <div class="card">
                              <div class="card-block">
                                  <form>
                                      <div class="row">
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Nombre del Producto</span></div>
                                                  <input type="text"  v-model="products_name" class="form-control">
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Suplidos</span></div>
                                                  <input type="text" disabled :value="user['name']" class="form-control">
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Características del Producto</span></div>
                                                  <textarea  v-model="products_caracts" class="form-control"></textarea>
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Categoria</span></div>
                                                  <select class="form-control" v-model="category_id">
                                                      <option v-for="datacategory in data_category" :key="datacategory.categories_id" :value="datacategory.categories_id">{{datacategory.categories_name}}</option>
                                                  </select>
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Colección</span></div>
                                                  <select class="form-control" v-model="collection_id">
                                                      <option v-for="datacollections in data_collection" :key="datacollections.collections_id" :value="datacollections.collections_id">{{datacollections.collections_name}}</option>
                                                  </select>
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Materiales</span></div>
                                                  <select class="form-control" v-model="materials_id">
                                                      <option v-for="data in data_material" :key="data.materials_id" :value="data.materials_id">{{data.materials_name}}</option>
                                                  </select>
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Estado del Producto</span></div>
                                                  <select class="form-control" v-model="products_is_active">
                                                      <option value="1">Ativo</option>
                                                      <option value="0">Inactivo</option>
                                                  </select>
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <div class="input-group">
                                                  <div class="input-group-prepend">
                                                  <span class="input-group-text"  id="basic-addon1">Costo del Producto</span></div>
                                                  <input v-model="products_price" class="form-control"/>
                                              </div>
                                        </div>
                                        <div class="col-lg-6">
                                              <vue2Dropzone ref="products_image_url" id="dropzone"
                                                    v-on:vdropzone-max-files-exceeded="maxFilesAlert"
                                                    :options="dropzoneOptions">
                                              </vue2Dropzone>
                                        </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                          <div class="card-footer">
                              <button class="btn btn-primary" type="button" @click="PostProducts">Registrar</button> 
                              <router-link to="/products">
                                  <button class="btn btn-warning" type="button">Cancelar</button>
                              </router-link>   
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

import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

export default {

  props:['user'],

  components: {
       vue2Dropzone
  },

  data:function(){
      return {
        data_category:[],
        data_collection:[],
        data_material:[],
        suplidor: this.user['id'],
        products_name:'',
        collection_id:'',
        category_id:'',
        materials_id:'',
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
                data.append("materials_id", this.materials_id)
                data.append("products_caracts", this.products_caracts)
                data.append("products_price", this.products_price)
                data.append("products_is_active", this.products_is_active)
                data.append("suplidor", this.suplidor)
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