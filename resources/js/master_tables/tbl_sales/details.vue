<template>
	

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
            <div class="row" style="padding-top: 2%;">
	          <div class="tg-formtheme tg-formdashboard">
	            <fieldset>
	              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                <div class="tg-dashboardbox">
	                  <div class="tg-dashboardholder">
	                    <table id="tg-adstype" class="table tg-dashboardtable tg-payments">
	                      <thead>
	                        <tr>
							              <th>Cliente</th>
	                          <th>Metodo de Pago</th>
	                          <th>Fecha de Entrega</th>
                            <th>Producto</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <tr data-category="packageone" v-for="(data, index) in data_details_sales" :key="index">
							              <td data-title="Cliente">
	                            <h3>{{data.customers.customers_name}}</h3>
	                          </td>
                            <td data-title="Cliente">
	                            <h3>{{data.sales.sales_payment_method}}</h3>
	                          </td>
                            <td data-title="Cliente">
	                            <h3>{{data.sales.sales_entrega_date}}</h3>
	                          </td>
                            <td data-title="Cliente">
	                            <h3>{{data.products.products_name}}</h3>
	                          </td>
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
			data_details_sales:[],
	    }
	},

	methods:{

		GetSalesDetails(){
			let me = this;		
      axios.post('/get_sales_details').then(function(response){
				me.data_details_sales = response.data;
				console.log(me.data_details_sales)
      });
		}


	},

	mounted() {
        let self = this
        self.GetSalesDetails();
    }

  
};
</script>

<style>
	
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