<template>
    <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">

                    <div class="page-body">
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-c-yellow update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">$ {{ parseFloat(calcularTotalSales).toFixed(2) }}</h4>
                                                <h6 class="text-white m-b-0">VENTAS POS</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-1" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <a href="/sales/pedidos">
                                            <div class="btn btn-three">
                                                <span>IR <i class="fa fa-arrow-circle-right fa-3x" aria-hidden="true"></i></span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-c-green update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">$ {{ parseFloat(calcularTotalLayaway).toFixed(2) }}</h4>
                                                <h6 class="text-white m-b-0">VENTAS LAYAWAY</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-2" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <a href="/layaway/pedidos">
                                            <div class="btn btn-three">
                                                <span>IR <i class="fa fa-arrow-circle-right fa-3x" aria-hidden="true"></i></span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-9 col-md-12">
                                <canvas id="Linechart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>

<script>

import ChartJS from 'chart.js/auto';
export default {
    data:function(){
        return {
            count_products:'',
            total_count_layaway:'',
            total_count_sales:'',
            data_provider:[],
            data_sales:[],
            years: [],
            labels: [],
        }
    },
    computed : {
		calcularTotalLayaway(){
			let me = this;	
			var resultado=0.0;
			for(var i=0;i< me.total_count_layaway.length;i++){
				resultado= resultado + me.total_count_layaway[i].layaway_profits[i].total_bussines_layaway;
			}
			return resultado;
		},


        calcularTotalSales(){
			var resultado=0.0;
			for(var i=0;i<this.total_count_sales.length;i++){
				resultado= resultado + this.total_count_sales[i].sales_profits[i].total_bussines;
			}
			return resultado;
		}

	},
  methods:{
        ChartProvider(){
            let me=this;
            axios.get('chart_provider').then(function(response){
                me.data_provider= response.data;
                console.log(me.data_provider);
                me.LineChart(response.data);
            })
        },

        LineChart(data){
        var ctx = document.getElementById('Linechart');
        console.log(Object.values(this.data_provider))
            var myChart = new ChartJS(ctx, {
                type: 'line',
                data: {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    datasets: [
                        {
                            label: 'SumaQ',
                            data: Object.values(data),
                            backgroundColor: "rgba(54,73,93,.5)",
                            borderColor: "#36495d",
                            borderWidth: 3
                        }
                    ],
                },
                
                options: {
                    responsive: true,
                    lineTension: 1,
                    scales: {
                    yAxes: [
                        {
                        ticks: {
                            beginAtZero: true,
                            padding: 25
                        }
                        }
                    ]
                    }
                }


            });
        },

        getDatadash(){
          let me=this;
            axios.get('/get_data_Dash').then(function(response){ 
                const array_data = response.data;
                //return the sum of all keys
                const groupAll = list => list.reduce((acc, item) => {
                    const accAmout = acc[item.person_id] || 0;
                    return Object.assign({}, acc, {[item.person_id]: accAmout + parseInt(item.amount, 10)});
                }, {});

                console.log("groupAll", groupAll(me.count_products));

                return array_data.forEach(element => {
                    me.count_products = element.products;
                    const productsByname = me.count_products.reduce((acc, value) =>{
                        console.log(acc);
                    },{});
                });          
            })
		},

        GetlayawayDetails(){
			let me = this;		
			axios.post('/get_layaway_details').then(function(response){
				me.total_count_layaway = response.data;
			});
		},

        GetSalesDetails(){
			let me = this;		
			axios.post('/get_sales_details').then(function(response){
				me.total_count_sales = response.data;
			});
		},
  
  },

  mounted() {
		  let self = this
            self.ChartProvider();
            self.getDatadash();
            self.GetlayawayDetails();
            self.GetSalesDetails();
	}
}

</script>


<style>
/* 
========================
      BUTTON THREE
========================
*/
.btn-three {
  color: #FFF;
  transition: all 0.5s;
  position: relative;
}
.btn-three::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  background-color: rgba(255,255,255,0.1);
  transition: all 0.3s;
}
.btn-three:hover::before {
  opacity: 0 ;
  transform: scale(0.5,0.5);
}
.btn-three::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
  transition: all 0.3s;
  border: 1px solid rgba(255,255,255,0.5);
  transform: scale(1.2,1.2);
}
.btn-three:hover::after {
  opacity: 1;
  transform: scale(1,1);
}
</style>