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
                                  <h4>REGISTRAR ORDEN</h4>                                                        
                              </div>
                          </div>
                        </div>
                    </div>
                </div>

                <div class="page-body">
                      <div class="row">
                          <div class="col-sm-12">
                              <div class="card">
                                <div class="card-block">
                                  <div>
                                    <div class="row">
                                      <div class="col-lg-4">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Compra solicitada por:</span></div>
                                                <input type="text" class="form-control" disabled :value="user['name']">
                                            </div>
                                      </div>
                                      <div class="col-lg-3">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Fecha:</span></div>
                                                <input type="text" class="form-control" disabled :value="fecha">
                                            </div>
                                      </div>
                                      <div class="col-lg-5">
                                            <div class="input-group">
                                                
                                                <autocomplete :search="search_proveedor"
                                                              placeholder="Proveedor"
                                                              :get-result-value="getResultValueProveedor"
                                                              @submit="onSubmitProveedor"> 
                                                </autocomplete>
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Fecha prevista de llegada</span></div>
                                                <input type="date" class="form-control" v-model="preview_arrival_date">
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text"  id="basic-addon1">Observaciones de la compra</span></div>
                                                <textarea  v-model="purchase_orders_observation" class="form-control"></textarea>
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                            <div class="input-group">
                                                <autocomplete :search="search_producto"
                                                              placeholder="Nombre de Producto"
                                                              :get-result-value="getResultValueProduct"
                                                              @submit="onSubmitProducto"> 
                                                </autocomplete>
                                            </div>
                                      </div>
                                      <div class="col-lg-6">
                                          <div class="card">  
                                            <div class="card-block">
                                              <div class="card-block table-border-style">
                                                <div class="dt-responsive table-responsive">
                                                  <table class="table">

                                                      <thead>
                                                        <tr>
                                                           <th>Producto</th>
                                                          <th>Cantidad</th>
                                                          <th>Sub-total</th>
                                                          <th>Opciones</th>
                                                        </tr>
                                                      </thead>

                                                      <tbody>
                                                        <tr v-for="(data, index) in data_order">
                                                          <td>{{data.products_name}}</td>
                                                          <td> <input type="text" class="form-control" v-model="data.total_products"> </td>
                                                          <td>{{ parseFloat(data.products_price* data.total_products ).toFixed(2)}}</td>
                                                          <td> <button @click="removeOrder(index)"><i class="fa fa-trash"> </i></button></td>
                                                        </tr>
                                                        <tr>
                                                          <td></td>
                                                          <td>Total</td>
                                                          <td>{{ purchase_orders_total_price= parseFloat(Total).toFixed(2)}}</td>
                                                        </tr>
                                                      </tbody>

                                                  </table>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                      </div>                                        
                                    </div>
                                  </div>
                                  <div class="card-footer">
                                      <button class="btn btn-primary" @click="PostProvider">Registrar</button>
                                      <router-link to="/provider">
                                          <button class="btn btn-danger">Cancelar</button>
                                      </router-link>
                                  </div>
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

import Autocomplete from '@trevoreyre/autocomplete-vue';
import '@trevoreyre/autocomplete-vue/dist/style.css'

export default {

    props:['user'],

    components: {
            Autocomplete
    },

  data:function(){
      return {
        products_id:'',
        providers_id:'',
        purchase_orders_solicited_by: this.user['id'],
        purchase_orders_solicited_date:'',
        providers_id:'',
        preview_arrival_date:'',
        purchase_orders_observation:'',
        purchase_orders_total_price:'',
        total_products:'',
        hoy: new Date(),  
        fecha:'',
        data_order:[],
        neworder: null,
      }
  },
  computed:{
      Total:function(){
        var resultado=0.0;
        for(var i=0;i<this.data_order.length;i++){
          resultado= resultado+(this.data_order[i].products_price*this.data_order[i].total_products);
        }
        return resultado;
      }
  },

  methods:{

            /**Producto**/
          search_producto(input) {
			      const url = `/search_producto/${encodeURI(input)}`
			 
			      return new Promise((resolve) => {
			        if (input.length < 3) {
			          return resolve([])
			        }
			 
			        fetch(url)
			          .then((response) => response.json())
			          .then((data) => {
			            resolve(data)
			          })
			      })
			    },


		      getResultValueProduct(result) {
			      return result.products_name;
			    },

			    onSubmitProducto(result) {
			    	  this.products_id=result.products_id;
              this.neworder = result;
              if(!this.neworder) return;
              this.data_order.push(this.neworder);
              this.neworder = '';
              this.saveOrder();
			    },

          removeOrder(x) {
            this.data_order.splice(x, 1);
            this.saveOrder();
          },

          saveOrder() {
            let parsed = JSON.stringify(this.data_order);
            localStorage.setItem('data_order', parsed);
          },

           

            /**Proveedor**/
                search_proveedor(input) {
			      const url = `/search_proveedor/${encodeURI(input)}`
			 
			      return new Promise((resolve) => {
			        if (input.length < 3) {
			          return resolve([])
			        }
			 
			        fetch(url)
			          .then((response) => response.json())
			          .then((data) => {
			            resolve(data)
			          })
			      })
			    },


		        getResultValueProveedor(result) {
			      return result.providers_name;
			    },

			    onSubmitProveedor(result) {
			    	this.providers_id=result.providers_id;
              this.providers_id = result.providers_id;
			      	console.log(result.providers_name);
			    },


        PostProvider(){

                axios.post('/post_order', {
                  'purchase_orders_solicited_by': this.purchase_orders_solicited_by,
                  'purchase_orders_solicited_date': this.purchase_orders_solicited_date,
                  'providers_id': this.providers_id,
                  'preview_arrival_date': this.preview_arrival_date,
                  'purchase_orders_observation': this.purchase_orders_observation,
                  'purchase_orders_total_price': this.purchase_orders_total_price,
                  'data_order_details':this.data_order
                })
                    .then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Orden Registrada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            localStorage.clear();
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

    mounted() {
        let self = this
        var mes = self.hoy.getMonth()+1; //obteniendo mes
        var dia = self.hoy.getDate(); //obteniendo dia
        var ano = self.hoy.getFullYear(); //obteniendo año
        if(dia<10)
            dia='0'+dia; //agrega cero si el menor de 10
        if(mes<10)
            mes='0'+mes;
        
        self.fecha = ano+"-"+mes+"-"+dia;
        self.purchase_orders_solicited_date = self.fecha;


        if (localStorage.getItem('data_order')) {
                try {
                  this.data_order = JSON.parse(localStorage.getItem('data_order'));
                } catch(e) {
                  localStorage.removeItem('data_order');
                }
        };

    

        
    }
  
};
</script>

<style>

.autocomplete-result-list{
    position: relative !important;
    list-style: none !important;
}
	
.nav-pills.nav-wizard > li {
  position: relative;
  overflow: visible;
  border-right: 15px solid transparent;
  border-left: 15px solid transparent;
}
.nav-pills.nav-wizard > li + li {
  margin-left: 0;
}
.nav-pills.nav-wizard > li:first-child {
  border-left: 0;
}
.nav-pills.nav-wizard > li:first-child a {
  border-radius: 5px 0 0 5px;
}
.nav-pills.nav-wizard > li:last-child {
  border-right: 0;
}
.nav-pills.nav-wizard > li:last-child a {
  border-radius: 0 5px 5px 0;
}
.nav-pills.nav-wizard > li a {
  border-radius: 0;
  background-color: #eee;
}
.nav-pills.nav-wizard > li:not(:last-child) a:after {
  position: absolute;
  content: "";
  top: 0px;
  right: -20px;
  width: 0px;
  height: 0px;
  border-style: solid;
  border-width: 20px 0 20px 20px;
  border-color: transparent transparent transparent #eee;
  z-index: 150;
}
.nav-pills.nav-wizard > li:not(:first-child) a:before {
  position: absolute;
  content: "";
  top: 0px;
  left: -20px;
  width: 0px;
  height: 0px;
  border-style: solid;
  border-width: 20px 0 20px 20px;
  border-color: #eee #eee #eee transparent;
  z-index: 150;
}
.nav-pills.nav-wizard > li:hover:not(:last-child) a:after {
  border-color: transparent transparent transparent #aaa;
}
.nav-pills.nav-wizard > li:hover:not(:first-child) a:before {
  border-color: #aaa #aaa #aaa transparent;
}
.nav-pills.nav-wizard > li:hover a {
  background-color: #aaa;
  color: #fff;
}
.nav-pills.nav-wizard > li.active:not(:last-child) a:after {
  border-color: transparent transparent transparent #428bca;
}
.nav-pills.nav-wizard > li.active:not(:first-child) a:before {
  border-color: #428bca #428bca #428bca transparent;
}
.nav-pills.nav-wizard > li.active a {
  background-color: #428bca;
}


</style>