<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
        <div class="tg-formtheme tg-formdashboard">
          <fieldset>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
              <div class="tg-dashboardbox">
                <div class="tg-dashboardboxtitle">
                  <h2>Actualizar Categoria</h2>
                </div>
                <div class="tg-dashboardholder">
                  <div class="form-group">
                      <input type="text"  v-model="categories_name" class="form-control" placeholder="Nombre de la Categoria">
                  </div>

                  <div class="form-group">
                        <vue2Dropzone ref="categories_image_url" id="dropzone"
                            v-on:vdropzone-max-files-exceeded="maxFilesAlert"
                            :options="dropzoneOptions">
                        </vue2Dropzone>
                  </div>
                  <div class="form-group">
                      <button class="btn btn-primary" type="button" @click="PostCategory">Registrar</button>
                      <router-link :to="{path: '/category'}">
                        <button class="btn btn-warning" type="button" >Cancelar</button>
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