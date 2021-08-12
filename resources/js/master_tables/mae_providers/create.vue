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
                                  <h4>REGISTRAR PROVEEDOR</h4>                                                        
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
                                                <span class="input-group-text"  id="basic-addon1">Nombre de Proveedor</span></div>
                                                <input type="text"  v-model="providers_name" class="form-control" >
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Documento de Proveedor</span></div>
                                                <input type="text"  v-model="providers_id_number" class="form-control">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Dirección</span></div>
                                                <input type="text"  v-model="providers_address" class="form-control" placeholder="Dirección">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Encargado</span></div>
                                                <input type="text"  v-model="providers_encargado" class="form-control" placeholder="Encargado">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Movil</span></div>
                                                <input type="text"  v-model="providers_mobile" class="form-control" placeholder="Movil">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Estado</span></div>
                                                <select class="form-control" v-model="providers_is_active">
                                                    <option value="1">Activo</option>
                                                    <option value="0">Inactivo</option>
                                                </select>
                                            </div>
                                      </div>
                                  </div>
                                  <div class="card-footer">
                                      <button class="btn btn-primary" type="button" @click="PostProvider">Registrar</button>
                                      <router-link to="/provider">
                                          <button class="btn btn-danger" type="button">Cancelar</button>
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

export default {

  data:function(){
      return {
        
        providers_name:'',
        providers_id_number:'',
        providers_address:'',
        providers_encargado:'',
        providers_mobile:'',
        providers_is_active:'',           
        
      }
  },


  methods:{

        PostProvider(){

                let  data = new FormData()
                data.append("providers_name", this.providers_name)
                data.append("providers_id_number", this.providers_id_number)
                data.append("providers_address", this.providers_address)
                data.append("providers_encargado", this.providers_encargado)
                data.append("providers_mobile", this.providers_mobile)
                data.append("providers_is_active", this.providers_is_active)
                axios.post('/post_provider', data)
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Proveedor Registrado',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/provider');
                        }else{
                            Swal.fire({
                              title: response.data.message,
                              text: 'Error al Registrar',
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