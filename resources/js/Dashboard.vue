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
  methods:{
    LineChart(){
      var ctx = document.getElementById('Linechart');
      var myChart = new ChartJS(ctx, {
          type: 'line',
          data: {
              labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
              datasets: [{
                  label: '# of Votes',
                  data: [12, 19, 3, 5, 2, 3],
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(255, 206, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(255, 159, 64, 0.2)'
                  ],
                  borderColor: [
                      'rgba(255, 99, 132, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(255, 206, 86, 1)',
                      'rgba(75, 192, 192, 1)',
                      'rgba(153, 102, 255, 1)',
                      'rgba(255, 159, 64, 1)'
                  ],
                  borderWidth: 1
              }]
          },
          options: {
              scales: {
                  y: {
                      beginAtZero: true
                  }
              }
          }
      });
    },
    Doughnutchart(){
      var ctx = document.getElementById('Doughnutchart');
      var myChart = new ChartJS(ctx, {
          type: 'doughnut',
          data: {
              labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
              datasets: [{
                  label: '# of Votes',
                  data: [12, 19, 3, 5, 2, 3],
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(255, 206, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(255, 159, 64, 0.2)'
                  ],
                  borderColor: [
                      'rgba(255, 99, 132, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(255, 206, 86, 1)',
                      'rgba(75, 192, 192, 1)',
                      'rgba(153, 102, 255, 1)',
                      'rgba(255, 159, 64, 1)'
                  ],
                  borderWidth: 1
              }]
          },
          options: {
              scales: {
                  y: {
                      beginAtZero: true
                  }
              }
          }
      });
    }
  },

  mounted() {
		  let self = this
		    self.LineChart();
        self.Doughnutchart();
	}
}

</script>
