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
                                    <h4>EDITAR PRODUCTO</h4>                                                        
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
                                                    <input type="text"  v-model="producto.products_name" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                    <span class="input-group-text"  id="basic-addon1">Características del Producto</span></div>
                                                    <textarea  v-model="producto.products_caracts" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                    <span class="input-group-text"  id="basic-addon1">Categoria</span></div>
                                                    <select class="form-control" v-model="producto.categories_id">
                                                        <option v-for="datacategory in data_category" :key="datacategory.categories_id" :value="datacategory.categories_id">{{datacategory.categories_name}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                    <span class="input-group-text"  id="basic-addon1">Colección</span></div>
                                                    <select class="form-control" v-model="producto.collections_id">
                                                        <option v-for="datacollections in data_collection" :key="datacollections.collections_id" :value="datacollections.collections_id">{{datacollections.collections_name}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                    <span class="input-group-text"  id="basic-addon1">Materiales</span></div>
                                                    <select class="form-control" v-model="producto.materials_id">
                                                        <option v-for="data in data_material" :key="data.materials_id" :value="data.materials_id">{{data.materials_name}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                    <span class="input-group-text"  id="basic-addon1">Estado del Producto</span></div>
                                                    <select class="form-control" v-model="producto.products_is_active">
                                                        <option value="1">Activo</option>
                                                        <option value="0">Inactivo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                    <span class="input-group-text"  id="basic-addon1">Costo del Producto</span></div>
                                                    <input v-model="producto.products_price" class="form-control" >
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
                                <button class="btn btn-primary" type="button" @click="editarProducto">Editar</button> 
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