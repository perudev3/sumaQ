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
                                                <h4 class="text-white">$30200</h4>
                                                <h6 class="text-white m-b-0">All Earnings</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-1" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-c-green update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">290+</h4>
                                                <h6 class="text-white m-b-0">Page Views</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-2" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update: 2:15 am</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-c-pink update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">145</h4>
                                                <h6 class="text-white m-b-0">Task Completed</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-3" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update: 2:15 am</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-c-lite-green update-card">
                                    <div class="card-block">
                                        <div class="row align-items-end">
                                            <div class="col-8">
                                                <h4 class="text-white">500</h4>
                                                <h6 class="text-white m-b-0">Downloads</h6>
                                            </div>
                                            <div class="col-4 text-right">
                                                <canvas id="update-chart-4" height="50"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update: 2:15 am</p>
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
            data_provider:[],
            data_sales:[],
            years: [],
            labels: [],
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
  
  },

  mounted() {
		  let self = this
            self.ChartProvider();
            self.getDatadash();
	}
}

</script>
