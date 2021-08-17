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
                                  <h4>REGISTRAR SUCURSAL</h4>                                                        
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
                                                <span class="input-group-text"  id="basic-addon1">Nombre deL Sucursal</span></div>
                                                <input type="text"  v-model="sucursals_name" class="form-control">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                          <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Dirección del Sucursal</span></div>
                                                <input type="text"  v-model="sucursals_address" class="form-control">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                          <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Estado</span></div>
                                                <select class="form-control" v-model="sucursals_is_active">
                                                    <option value="1">Ativo</option>
                                                    <option value="0">Inactivo</option>
                                                </select>
                                            </div>
                                      </div>
                                  </div>                                        
                                  <br><br>
                                  <div class=" ">
                                        <button class="btn btn-primary" type="button" @click="PostSucusals">Registrar</button>
                                        <router-link :to="{path: '/sucursal'}">
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
        sucursals_name:'',
        sucursals_address:'',
        sucursals_is_active:'',
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
               this.$refs.collections_image_url.removeFile(file);
        },
        

        PostSucusals(){

                let  data = new FormData()
                data.append("sucursals_name", this.sucursals_name)
                data.append("sucursals_address", this.sucursals_address)
                data.append("sucursals_is_active", this.sucursals_is_active)
                axios.post('/post_sucursal', data,{ headers: {'Content-Type': 'multipart/form-data'}})
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Sucursal Registrada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/sucursal');
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