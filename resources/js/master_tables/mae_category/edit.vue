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
                                  <h4>Actualizar Categoria</h4>                                                        
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
                                                <span class="input-group-text"  id="basic-addon1">Nombre de la Categoria</span></div>
                                                <input type="text"  v-model="categories_name" class="form-control">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                          <div class="col-lg-12">
                                              <vue2Dropzone ref="categories_image_url" id="dropzone"
                                                  v-on:vdropzone-max-files-exceeded="maxFilesAlert"
                                                  :options="dropzoneOptions">
                                              </vue2Dropzone>
                                          </div>
                                      </div>
                                  </div>                                        
                                    <br><br>
                                  <div class="form-footer">
                                      <button class="btn btn-primary" type="button" @click="PostCategory">Registrar</button>
                                      <router-link :to="{path: '/category'}">
                                        <button class="btn btn-danger" type="button" >Cancelar</button>
                                      </router-link>
                                  </div>
                                </form>
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

import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

export default {

  components: {
       vue2Dropzone
  },

  data:function(){
      return {
        data_category: this.$route.params.data_category,
        categories_id:'',
        categories_name:'',
        categories_image_url:'',
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
        

        PostCategory(){
                this.$refs.categories_image_url.processQueue();
                let images  = this.$refs.categories_image_url.getAcceptedFiles();
                let index = 0;
                let files  = []
                let  data = new FormData()

                for( let i = 0; i < images.length; i++ ){
                    let file = images[i];
                    data.append('categories_image_url[' + i + ']', file);
                }

                data.append("categories_name", this.categories_name)
                data.append("categories_id", this.categories_id)
                axios.post('/edit_categories', data,{ headers: {'Content-Type': 'multipart/form-data'}})
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Categoria Actualizada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/category');
                        }else{
                            Swal.fire({
                              title: response.data.message,
                              text: 'Medidas Incorrectas de las Imagenes',
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
    	self.data_category;
      self.categories_name = self.data_category['categories_name'];
      self.categories_id = self.data_category['categories_id'];
  }
  
};
</script>