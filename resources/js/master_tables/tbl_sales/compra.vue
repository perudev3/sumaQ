<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
            <ul class="nav nav-pills nav-wizard">
			    <li style="width: 35%;"><a>Pedidos</a></li>
			    <li style="width: 35%;" class="active"><a>Compra</a></li>
			    <li style="width: 30%;"><a>Pago</a></li>
			</ul>
	      <div class="row">
	          <div class="tg-formtheme tg-formdashboard">
	            <fieldset>
	              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                <div class="tg-dashboardbox">
	                  <div class="tg-dashboardholder">
	                    <table id="tg-adstype" class="table tg-dashboardtable tg-payments">
	                      <thead>
	                        <tr>
	                          <th>Nombre</th>
	                          <th>Imagen</th>
                              <th>Precio</th>
                              <th>Cantidad</th>
                              <th>Sub-Total</th>
	                          <th>Action</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <tr data-category="packageone" v-for="(data, index) in data">
	                          <td data-title="Nombre">
	                            <h3>{{data.products_name}}</h3>
	                          </td>
                              <td data-title="Nombre">
	                            <img :src="'/img_products/'+data.products_image_url" />
	                          </td>
                              <td data-title="Nombre">
	                            <h3>{{data.products_price}}</h3>
	                          </td>
                              <td data-title="Nombre">
	                            <input type="text" class="form-control" v-model="data.cantidad"></input>
	                          </td>
                              <td>{{ parseFloat(data.products_price* data.cantidad ).toFixed(2)}}</td>
	                          <td data-title="Action">
	                            <div class="tg-btnsactions">
	                              <a class="tg-btnaction tg-btnactionview" href="javascript:void(0);"><i class="fa fa-eye"></i></a>
	                              <a class="tg-btnaction tg-btnactiondelete" href="javascript:void(0);"><i class="fa fa-trash"></i></a>
	                            </div>
	                          </td>
	                        </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>Total</td>
                                <td>{{ total= parseFloat(Total).toFixed(2)}}</td>
                            </tr>
	                      </tbody>
	                    </table>
	                  </div>

	                </div>
	              </div>
	            </fieldset>
	          </div>
	      </div>
		</section>
	</main>
	
</template>


<script>

export default {

  data:function(){
      return {
        data_pedidos: this.$route.params.array_pedidos,
        data:[],
        cantidad:'',
        total:'',
      }
  },

  computed:{
      Total:function(){
        var resultado=0.0;
        for(var i=0;i<this.data.length;i++){
          resultado= resultado+(this.data[i].products_price*this.data[i].cantidad);
        }
        return resultado;
      }
  },


  methods:{

 
        

  },

   mounted() {
        let me=this;
        axios.post('/get_products_pedidos', {'data_pedidos':this.data_pedidos}).then(function(response){
            me.data = response.data;
        });
    }

  
};
</script>