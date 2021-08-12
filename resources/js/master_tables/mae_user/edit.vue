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
                                  <h4>Registrar Usuario</h4>                                                        
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
                                    <div class="col-lg-10">
                                          
                                          <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">Nombre y Apellidos</span></div>
                                              <input type="text"  v-model="name" class="form-control">
                                          </div>
                                    </div>                                    
                                  </div>  
                                  <div class="row">
                                    <div class="col-lg-4">
                                          <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">Documento de Identidad</span></div>
                                              <input type="text"  v-model="identification_document" class="form-control">
                                          </div>
                                    </div>
                                    <div class="col-lg-4">
                                          <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">Celular</span></div>
                                              <input type="text"  v-model="movil" class="form-control">
                                          </div>
                                    </div>
                                    <div class="col-lg-4">
                                          <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">Direccion</span></div>
                                              <input type="text"  v-model="address" class="form-control">
                                          </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    
                                    <div class="col-lg-6">
                                          <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">Área</span></div>
                                              <input type="text"  v-model="area" class="form-control">
                                          </div>
                                    </div>

                                    <div class="col-lg-6">
                                          <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">Cargo</span></div>
                                              <select class="form-control" v-model="roles_id">
                                                  <option v-for="data in data_roles" :value="data.roles_id">{{ data.rol_name }}</option>
                                              </select>
                                          </div>
                                    </div>
                                    
                                  </div>
                                  <div class="row">
                                    
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                              <div class="input-group-prepend">
                                              <span class="input-group-text"  id="basic-addon1">E-mail</span></div>
                                              <input type="email"  v-model="email" class="form-control">
                                        </div>
                                    </div>
                                  </div>                                 
                                  <br><br>
                                  <div class=" ">
                                        <button class="btn btn-primary" type="button" @click="UpdateUsers">Registrar</button>
                                        <router-link :to="{path: '/user'}">
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

export default {

  data:function(){
      return {
        data_users: this.$route.params.data_users,
        data_roles:[],
        roles_id:'',
        id:'',
        name:'',
        identification_document:'',
        movil:'',
        address:'',
        area:'',
        email:'',
      }
  },


  methods:{

        GetRoles(){
          let me = this;
          axios.get('/get_roles').then(function(response){
              me.data_roles=response.data;
          })
        },

        UpdateUsers(){
                let me = this;
                axios.put('/update_user', {
                    'roles_id':me.roles_id,
                    'name' : me.name,
                    'identification_document': this.identification_document,
                    'movil': this.movil,
                    'address': this.address,
                    'area': this.area,
                    'email' : me.email,
                    'id': me.id,
                }).then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Usuario Actualizada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/user');
                        };
                }).catch(function (error) {
                    console.log(error);
                });
        },

  },

  mounted() {
    	let self = this
      self.GetRoles();
    	self.data_users;
      self.roles_id = self.data_users['roles_id'];
        self.name = self.data_users.user['name'];
        self.identification_document = self.data_users['identification_document'];
        self.movil = self.data_users['movil'];
        self.address = self.data_users['address'];
        self.area = self.data_users['area'];
        self.email = self.data_users.user['email'];
        self.id = self.data_users['id'];
  }
  
};
</script>