<template>

    <main id="tg-main" class="tg-main tg-haslayout">
        <section class="tg-dbsectionspace tg-haslayout tg-statistics">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
						<div class="tg-dashboardbox tg-statistic">
							<figure>
                  <i class="fa fa-database fa-3x"></i>
              </figure>
							<div class="tg-contentbox">
                <h3>Capacity</h3><br>
								<span style="font-size: 30px;">150GB</span>							
								<a class="tg-btnviewdetail" href="javascript:void(0);" style="left: 15px !important;">
                    <i class="fa fa-refresh" aria-hidden="true"></i> Update Now
                </a>
							</div>
						</div>
					</div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
						<div class="tg-dashboardbox tg-statistic">
							<figure>
                                <i class="fa fa-google-wallet fa-3x"></i>
                            </figure>
							<div class="tg-contentbox">
                                <h3>Revenue</h3><br>
								<span style="font-size: 30px;">$1,345</span>							
								<a class="tg-btnviewdetail" href="javascript:void(0);" style="left: 15px !important;">
                                    <i class="fa fa-calendar" aria-hidden="true"></i> Last Day
                                </a>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
						<div class="tg-dashboardbox tg-statistic">
							<figure>
                                <i class="fa fa-pie-chart fa-3x"></i>
                            </figure>
							<div class="tg-contentbox">
                                <h3>Error</h3><br>
								<span style="font-size: 30px;">23</span>							
								<a class="tg-btnviewdetail" href="javascript:void(0);" style="left: 15px !important;">
                                    <i class="fa fa-calendar" aria-hidden="true"></i> Last Day
                                </a>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
						<div class="tg-dashboardbox tg-statistic">
							<figure>
                                <i class="fa fa-twitter fa-3x"></i>
                            </figure>
							<div class="tg-contentbox">
                                <h3>Follower</h3><br>
								<span style="font-size: 30px;">+45</span>							
								<a class="tg-btnviewdetail" href="javascript:void(0);" style="left: 15px !important;">
                                    <i class="fa fa-refresh" aria-hidden="true"></i> Update Now
                                </a>
							</div>
						</div>
					</div>
					
				</div>
		</section>

        <section class="tg-dbsectionspace tg-haslayout tg-statistics">
          <br><br>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">  
                    <canvas id="Linechart"></canvas>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">  
                    <canvas id="Doughnutchart"></canvas>
                </div>
            </div>
        </section>
    </main>

</template>

<script>

import ChartJS from 'chart.js/auto';
export default {
    data:function(){
        return {
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

  
  },

  mounted() {
		  let self = this
            self.ChartProvider();
	}
}

</script>
