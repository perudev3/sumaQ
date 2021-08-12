<template>

  <div class="pcoded-content">
    <div class="pcoded-inner-content">
            <!-- Main-body start -->
      <div class="main-body">
        <div class="page-wrapper">
					<div class="page-body">
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                                <div class="card-block">
                                  <div class="row">
                                    <div class="col-md-12">
                                      <div id="wizard1">
                                        <section>
                                          <form class="wizard-form wizard clearfix" id="basic-forms">
                                            <div class="steps clearfix">
                                              <ul role="tablist">
                                                <li role="tab" class="done" aria-disabled="false" aria-selected="false" @click="Pedidos" align="center">
                                                  <a id="basic-forms-t-0" aria-controls="basic-forms-p-0">
                                                    <span class="current-info audible">current step: </span>
                                                    <span class="number"><i class="fa fa-qrcode fa-3x" aria-hidden="true"></i></span> 
                                                  </a>
                                                </li>
                                                <li role="tab" class="first current" aria-disabled="false" aria-selected="true" align="center">
                                                  <a id="basic-forms-t-1" aria-controls="basic-forms-p-1">
                                                    <span class="number"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i></span>
                                                  </a>
                                                </li>
                                                <li role="tab" class="done" aria-disabled="false" aria-selected="false" align="center">
                                                  <a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
                                                    <span class="number"><i class="fa fa-list-alt fa-3x" aria-hidden="true"></i></span>
                                                  </a>
                                                </li>
                                                <li role="tab" class="done" aria-disabled="false" aria-selected="false" align="center">
                                                  <a id="basic-forms-t-2" aria-controls="basic-forms-p-2">
                                                    <span class="number"><i class="fa fa-check-circle fa-3x" aria-hidden="true"></i></span>
                                                  </a>
                                                </li>
                                              </ul>
                                            </div>
                                            <div class="clearfix" style="margin-top: 50px;">
                                              <table id="simpletable" class="table table-responsive ">
                                                <thead>
                                                  <tr>
                                                    <th>Nombre</th> 
                                                    <th>Codigo</th> 
                                                    <th>Precio</th> 
                                                    <th>Imagen</th> 
                                                    <th>Opciones</th>
                                                  </tr>
                                                </thead> 
                                                <tbody>
                                                  <tr v-for="(data, index) in data"
                                                        :key="index">
                                                    <td>
                                                        {{ data.products.products_name }}
                                                    </td> 
                                                    <td>
                                                        {{ data.inventories_codigo }}
                                                    </td> 
                                                    <td>
                                                        $ {{ data.products.products_price }}
                                                    </td> 
                                                    <td align="center">
                                                      <img :src="data.products.products_image_url ? '/img_products/'+data.products.products_image_url : '/img/logo.jpeg'" style="width: 25%;"/>
                                                    </td> 
                                                    <td>
                                                      <a>
                                                        Quitar
                                                        <div class="feather icon-trash"></div>
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                                <tfoot>
                                                    <div class="input-group">
                                                      <div class="input-group-prepend">
                                                        <span class="input-group-text"  id="basic-addon1">Total <i class="fa fa-dollar"></i> </span>
                                                      </div>
                                                      <input type="text"  :value="totalPrice" disabled class="form-control">
                                                    </div>
                                                </tfoot>
                                              </table>
                                            </div>
                                            <fieldset id="basic-forms-p-0" role="tabpanel" aria-labelledby="basic-forms-h-0" class="body current" aria-hidden="false" style="left: 0px;">
                                                  <div class="mt-4 mb-28 bg-white rounded w-full shadow px-4 py-4">
                                                    <div class="flex justify-end">
                                                      <div
                                                        @click="Pago"
                                                        class="btn btn-primary">
                                                          Siguiente
                                                        <i class="fa fa-chevron-right"></i>
                                                      </div>
                                                    </div>
                                                  </div>
                                            </fieldset>
                                          </form>
                                        </section>
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
    </div>
	</div>

</template>


<style>
html, body {
	font-size: 16px;
}
</style>


<script>
export default {
  data: function () {
    return {
      data_pedidos: this.$route.params.array_pedidos,
      data: [],
      cantidad: "",
      total: "",
    };
  },

  computed: {
		totalPrice () {
			return this.data.reduce(
					(y, x) => y + parseFloat(x.products.products_price), 0)
				.toFixed(2);
		},

  },

  methods: {
    Pedidos() {
      this.$router.push({ name: "sales/pedidos" });
    },

    Pago() {
      this.$router.push({
        name: "sales/pago",
        params: { total: this.totalPrice, data_pedidos: this.data_pedidos },
      });
    },

    removeOrder(x) {
      this.data_pedidos.splice(x, 1);
      this.saveOrder();
    },

    saveOrder() {
      let parsed = JSON.stringify(this.data_pedidos);
      //localStorage.setItem('data_pedidos', parsed);
      localStorage.setItem("array_pedidos", parsed);
      this.getPedidos(this.data_pedidos);
    },

    getPedidos(data_pedidos) {
      console.log("Consultando pedidos ...");
      let me = this;
      axios
        .post("/get_products_pedidos", { data_pedidos: data_pedidos })
        .then(function (response) {
          me.data = response.data;
          console.log("Mostrando dato del pedido");
          console.log(response.data);
        });
      console.log("Saliendo de getPedidso");
    },
  },

  mounted() {
    let me = this;
    if (localStorage.getItem("array_pedidos")) {
      try {
        //this.data_pedidos = JSON.parse(localStorage.getItem('data_pedidos'));
        this.data_pedidos = JSON.parse(localStorage.getItem("array_pedidos"));
      } catch (e) {
        localStorage.removeItem("array_pedidos");
      }
    }

    me.getPedidos(this.data_pedidos);
  },
};
</script>