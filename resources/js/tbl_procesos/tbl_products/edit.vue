<template>
   <main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
        <div class="tg-formtheme tg-formdashboard">
          <fieldset>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
              <div class="tg-dashboardbox">
                <div class="tg-dashboardboxtitle">
                  <h2>Editar Producto</h2>
                </div>
                <div class="tg-dashboardholder">
                    <div class="form-group">
                        <vue2Dropzone ref="products_image_url" id="dropzone"
                            v-on:vdropzone-max-files-exceeded="maxFilesAlert"
                            :options="dropzoneOptions">
                        </vue2Dropzone>
                  </div>
                  <div class="form-group">
                      <input type="text"  v-model="producto.products_name" class="form-control" placeholder="Nombre del Producto">
                  </div>
                  <div class="form-group">
                      <textarea  v-model="producto.products_caracts" class="form-control" placeholder="Caracteristicas del Producto"></textarea>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="producto.category_id">
                         <option v-for="datacategory in data_category" :key="datacategory.categories_id" :value="datacategory.categories_id">{{datacategory.categories_name}}</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="producto.collections_id">
                         <option v-for="datacollections in data_collection" :key="datacollections.collections_id" :value="datacollections.collections_id">{{datacollections.collections_name}}</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="producto.materials_id">
                         <option v-for="data in data_material" :key="data.materials_id" :value="data.materials_id">{{data.materials_name}}</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <select class="form-control" v-model="producto.products_is_active">
                         <option value="1">Activo</option>
                         <option value="0">Inactivo</option>
                     </select>
                  </div>
                  <div class="form-group">
                      <input v-model="producto.products_size" class="form-control" placeholder="Tamaño del Producto"/>
                  </div>
                  <div class="form-group">
                      <input v-model="producto.products_price" class="form-control" placeholder="Precio del Producto"/>
                  </div>
                  <div class="form-group">
                      <button class="btn btn-primary" type="button" @click="editarProducto">Editar</button>                      
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
    data(){
        return {
            producto : this.$route.params.data_product,
            data_category:[],
            data_collection:[],
            data_material:[],
            products_image_url:'',
            dropzoneOptions: {
                url: 'empresa/producto',
                thumbnailWidth: 150,
                maxFilesize: 1.5,
                addRemoveLinks : true,
                autoProcessQueue:false,
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                maxFiles:1,
                uploadMultiple: true
            }
        }
    },
    methods:{

        // Obtener categorias
        GetCategories(){
            let me=this;
            axios.get('/get_categories').then(function(response){
                me.data_category = response.data;
            });
        },

        // Obtener colecciones
        GetCollections(){
              let me=this;
              axios.get('/get_collection').then(function(response){
                me.data_collection = response.data;
          });
        },

        // Obtener materiales
        GetMaterials(){
              let me=this;
              axios.get('/get_material').then(function(response){
                me.data_material = response.data;
          });
        },

        // Dropzone si suben mas de los archivos permitidos
        maxFilesAlert(file){
            Swal.fire({
                title: 'No permitido',
                text: 'Solo se permiten 1 archivos',
                type: 'error',
                confirmButtonText: 'OK'
            })
            this.$refs.products_image_url.removeFile(file);
        },

        // Editar producto
        editarProducto(){

            //this.$refs.products_image_url.processQueue();
            let images  = this.$refs.products_image_url.getAcceptedFiles();

            let  data = new FormData()
            data.append('products_image_url', images[0]);
            data.append('products_id', this.producto.products_id);
            data.append("products_name", this.producto.products_name)
            data.append("collections_id", this.producto.collections_id)
            data.append("category_id", this.producto.category_id)
            data.append("materials_id", this.producto.materials_id)
            data.append("products_caracts", this.producto.products_caracts)
            data.append("products_size", this.producto.products_size)
            data.append("products_price", this.producto.products_price)
            data.append("products_is_active", this.producto.products_is_active)
            axios.post('/put_products', data,{ headers: {'Content-Type': 'multipart/form-data'}})
                .then(response => {
                    if (response.data.status==='success') {
                        Swal.fire({
                            title: response.data.message,
                            text: 'Producto Editado',
                            type: 'success',
                            confirmButtonText: 'OK'
                        });
                        this.$router.replace('/products');
                    }else{
                        Swal.fire({
                            title: response.data.message,
                            text: 'Error al editar Producto',
                            type: 'error',
                            confirmButtonText: 'OK'
                        })
                    };
            }).catch(function (error) {
                console.log(error);
            });
        }
    },
    mounted() {
        
        this.GetCategories();
        this.GetCollections();
        this.GetMaterials();
            
    }
}
</script>