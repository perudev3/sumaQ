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
                                  <h4>Registrar Material</h4>                                                        
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
                                                <span class="input-group-text"  id="basic-addon1">Nombre del Material</span></div>
                                                <input type="text"  v-model="materials_name" class="form-control">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                          <div class="col-lg-12">
                                              <vue2Dropzone ref="materials_image_url" id="dropzone"
                                                  v-on:vdropzone-max-files-exceeded="maxFilesAlert"
                                                  :options="dropzoneOptions">
                                              </vue2Dropzone>
                                          </div>
                                      </div>
                                  </div>                                        
                                  <br><br>
                                  <div class=" ">
                                        <button class="btn btn-primary" type="button" @click="PostMaterials">Registrar</button>
                                        <router-link :to="{path: '/material'}">
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
        materials_name:'',
        materials_image_url:'',
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
               this.$refs.materials_image_url.removeFile(file);
        },
        

        PostMaterials(){
                this.$refs.materials_image_url.processQueue();
                let images  = this.$refs.materials_image_url.getAcceptedFiles();
                let index = 0;
                let files  = []
                let  data = new FormData()

                for( let i = 0; i < images.length; i++ ){
                    let file = images[i];
                    data.append('materials_image_url[' + i + ']', file);
                }

                data.append("materials_name", this.materials_name)
                axios.post('/post_material', data,{ headers: {'Content-Type': 'multipart/form-data'}})
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Material Registrada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/material');
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
  
};
</script>