<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
        <div class="tg-formtheme tg-formdashboard">
          <fieldset>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
              <div class="tg-dashboardbox">
                <div class="tg-dashboardboxtitle">
                  <h2>Actualizar Usuario</h2>
                </div>
                <div class="tg-dashboardholder">
                  <div class="form-group">
                      <input type="text"  v-model="name" class="form-control">
                  </div>
                  <div class="form-group">
                      <label>Cargo</label>
                      <select class="form-control" v-model="roles_id">
                          <option v-for="data in data_roles" :value="data.roles_id">{{ data.rol_name }}</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <input type="email"  v-model="email" class="form-control">
                  </div>

                  <div class="form-group">
                      <button class="btn btn-primary" type="button" @click="UpdateUsers">Registrar</button>
                      <router-link :to="{path: '/user'}">
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

export default {

  data:function(){
      return {
        data_users: this.$route.params.data_users,
        data_roles:[],
        roles_id:'',
        id:'',
        name:'',
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
        self.name = self.data_users['name'];
        self.email = self.data_users['email'];
        self.id = self.data_users['id'];
  }
  
};
</script>