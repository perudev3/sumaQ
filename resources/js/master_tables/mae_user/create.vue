<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
        <div class="tg-formtheme tg-formdashboard">
          <fieldset>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6 tg-lgcolwidthhalf">
              <div class="tg-dashboardbox">
                <div class="tg-dashboardboxtitle">
                  <h2>Registrar Usuario</h2>
                </div>
                <div class="tg-dashboardholder">
                  <div class="form-group">
                      <label for="">Nombre de Usuario</label>
                      <input type="text"  v-model="name" class="form-control">
                  </div>
                  <div class="form-group">
                      <label for="">E-mail</label>
                      <input type="text"  v-model="email" class="form-control">
                  </div>
                  <div class="form-group">
                      <label for="">Contraseña</label>
                      <input type="text"  v-model="password" class="form-control">
                  </div>
                  <div class="form-group">
                      <button class="btn btn-primary" type="button" @click="PostUsers">Registrar</button>
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
            name:'',
            email:'',
            password:'',
        }
    },
  methods:{
        PostUsers(){
                axios.post('/post_users',{
                    'name': this.name,
                    'email': this.email,
                    'password': this.password,
                }).then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Exito al Registrar Usuario',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/user');
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