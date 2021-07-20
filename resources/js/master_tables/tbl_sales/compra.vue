<template>

  <main
    id="tg-main"
    class="tg-main tg-haslayout"
    style="background: rgb(219, 219, 219);"
  >
    <section class="tg-dbsectionspace tg-haslayout">
      <ul class="nav nav-pills nav-wizard">
        <li
          style="width: 35%;"
          @click="Pedidos"
        ><a>Pedidos</a></li>
        <li
          style="width: 35%;"
          class="active"
        ><a>Compra</a></li>
        <li style="width: 30%;"><a>Pago</a></li>
      </ul>

      <div
        class="grid">
				<div class="mt-4 mb-28 bg-white rounded w-full shadow px-4 py-4">
					
					<div class="flex flex-wrap gap-5 justify-around">

						<div
							v-for="(data, index) in data"
							:key="index">
							<div
								class="flex px-3 py-2 border rounded cursor-pointer"
								>
								<div class="bg-black h-28 w-28 bg-center bg-cover" :style="{backgroundImage: `url('/img_products/${data.products_image_url}')`}"></div>
								<div class="grid px-4">
									<div class="font-bold flex items-center justify-between gap-3">
										<div class="uppercase">
											{{ data.products_name }}
										</div>
										<div class="text-xs text-gray-400">{{ data.inventories_codigo }}</div>
									</div>
									
									<div class="">$ {{ data.products_price }}</div>
									
									<div class="flex justify-center">
										<div class="rounded text-xs gap-4 uppercase flex justify-between items-center px-2 font-bold bg-red-500 text-white
											hover:bg-red-600 cursor-pointer"
											@click="removeOrder(index)">
											Quitar
											<div class="fa fa-trash"></div>
										</div>
									</div>
								</div>
								
							</div>
							
						</div>

					</div>

					<div class="text-xl font-bold py-4 text-right">
						Total: ${{ totalPrice }}
					</div>
					<div class="flex justify-end">
						<div
							@click="Pago"
							class="font-bold uppercase bg-green-600 inline-block px-4 py-3 rounded text-white
								flex items-center gap-3
								hover:bg-green-700 cursor-pointer hover transition-all ease-out duration-300 hover:scale-105 transform">
							Finalizar compra
							<i class="fa fa-chevron-right"></i>
						</div>
					</div>

				</div>

        <div class="tg-formtheme tg-formdashboard">
          <fieldset>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <div class="tg-dashboardbox">
                <div class="tg-dashboardholder">
                  <table
                    id="tg-adstype"
                    class="table tg-dashboardtable tg-payments"
                  >
                    <thead>
                      <tr>
                        <th>Codigo de Inventario</th>
                        <th>Nombre</th>
                        <th>Imagen</th>
                        <th>Precio</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr
                        data-category="packageone"
                        v-for="(data, index) in data"
                        :key="index"
                      >
                        <td data-title="Codigo Inventario">
                          <h3>{{data.inventories_codigo}}</h3>
                        </td>
                        <td data-title="Nombre">
                          <h3>{{data.products_name}}</h3>
                        </td>
                        <td data-title="Imagen">
                          <img :src="'/img_products/'+data.products_image_url" />
                        </td>
                        <td data-title="Precio">
                          <h3>{{data.products_price}}</h3>
                        </td>
                        <td data-title="Action">
                          <div class="tg-btnsactions">
                            <a
                              class="tg-btnaction tg-btnactiondelete"
                              @click="removeOrder(index)"
                            >
                              <i class="fa fa-trash"></i>
                            </a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td></td>
                        <td></td>
                        <td>Total</td>
                        <td>{{ total= parseFloat(Total).toFixed(2)}}</td>
                      </tr>
                      <tr>
                        <br><br>
                        <div class="footer">
                          <div class="form-group">
                            <button
                              @click="Pago"
                              class="btn btn-primary"
                            >Finalizar Compra</button>
                          </div>
                        </div>
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
					(y, x) => y + parseFloat(x.products_price), 0)
				.toFixed(2);
		},

    Total: function () {
      var resultado = 0.0;
      for (var i = 0; i < this.data.length; i++) {
        resultado = resultado + this.data[i].products_price;
      }
      return resultado;
    },
  },

  methods: {
    Pedidos() {
      this.$router.push({ name: "sales/pedidos" });
    },

    Pago() {
      this.$router.push({
        name: "sales/pago",
        params: { total: this.total, data_pedidos: this.data_pedidos },
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