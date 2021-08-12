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
                                  <h4>REGISTRAR DESCUENTO</h4>                                                        
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
                                    <div class="form-group">
                                        <input type="text"  v-model="discounts_name" class="form-control" placeholder="Nombre del descuento">
                                    </div>
                                    <div class="form-group">
                                        <input type="number"  v-model="discounts_porcentaje" class="form-control" placeholder="tasa de porcentaje">
                                    </div>
                                    <div class="form-group">
                                        <label >Fecha de Inicio</label>
                                        <input type="date"  v-model="discounts_start_date" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                      <label> Fecha de Finalización</label>
                                        <input type="date"  v-model="discounts_end_date" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <input type="text"  v-model="discounts_stock_max" class="form-control" placeholder="Stock maximo">
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="button" @click="PostDiscount">Registrar</button>
                                        <router-link to="/discount">
                                          <button class="btn btn-warning" type="button">Cancelar</button>
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
        discounts_name:'',
        discounts_porcentaje:'',
        discounts_start_date:'',
        discounts_end_date:'',
        discounts_stock_max:'',
      }
  },


  methods:{

        PostDiscount(){

                let  data = new FormData()
                data.append("discounts_name", this.discounts_name)
                data.append("discounts_porcentaje", this.discounts_porcentaje)
                data.append("discounts_start_date", this.discounts_start_date)
                data.append("discounts_end_date", this.discounts_end_date)
                data.append("discounts_stock_max", this.discounts_stock_max)
                axios.post('/post_discount', data)
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Descuento Actualizado',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            this.$router.replace('/discount');
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