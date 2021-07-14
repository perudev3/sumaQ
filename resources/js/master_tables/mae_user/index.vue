<template>

	<main id="tg-main" class="tg-main tg-haslayout" style="background: rgb(219, 219, 219);">
		<section class="tg-dbsectionspace tg-haslayout">
	      <div class="row">
	          <div class="tg-formtheme tg-formdashboard">
	            <fieldset>
	              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	                <div class="tg-dashboardbox">
	                  <div class="tg-dashboardholder">
					  	
						<div class="tg-otherfilters">
							<div class="row">
								<div class="col-xs-12 col-sm-5 col-md-5 col-lg-4 pull-left">
									<div  class="form-group tg-inputwithicon">
										<router-link to="/user/create">
											<button class="btn btn-primary">
												+ Nuevo Usuario
											</button>
										</router-link>
									</div>
								</div>
								<div class="col-xs-12 col-sm-5 col-md-5 col-lg-4 pull-right">
									<div class="form-group tg-inputwithicon">
										<i class="icon-magnifier"></i>
										<input type="search" class="form-control" placeholder="Nombre del Usuario"  v-model="users_name" v-on:keyup="searchUsers">
									</div>
								</div>
							</div>
						</div>


	                    <table id="tg-adstype" class="table tg-dashboardtable tg-payments">
	                      <thead>
	                        <tr>
	                          <th>Nombre</th>
	                          <th>E-mail</th>
                              <th>Fecha de Creación</th>
	                          <th>Action</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <tr data-category="packageone" v-for="(data, index) in searchInUsers">
	                          <td data-title="Nombre">
	                            <h3>{{data.name}}</h3>
	                          </td>
	                          <td data-title="Email">
	                            <h3>{{data.email}}</h3>
	                          </td>
                              <td data-title="Fecha de Creación">
                                  <h3>{{data.created_at  | dateFormat}}</h3>
                              </td>
	                          <td data-title="Action">
	                            <div class="tg-btnsactions">
	                              <a class="tg-btnaction tg-btnactionview" @click="EditUser(data)"><i class="fa fa-pencil"></i></a>
	                              <a class="tg-btnaction tg-btnactiondelete" href="javascript:void(0);"><i class="fa fa-trash"></i></a>
	                            </div>
	                          </td>
	                        </tr>
	                      </tbody>
	                    </table>

	                    <div class="card-footer" style="background-color: rgb(0 0 0 / 0%) !important;border-top: 1px solid rgb(255 255 255 / 13%) !important;">
	                        <nav aria-label="Page navigation" class="float-left">
	                            <ul class="pagination">
	                            <!--Botones anteriores-->
	                                <li v-if="pagination.currentPage == 1" class="page-item disabled">
	                                    <a class="page-link" href="#" aria-label="Previous">
	                                        <span aria-hidden="true"><i class="fa fa-fast-backward"></i></span>
	                                        <span class="sr-only">Previous</span>
	                                    </a>
	                                </li>
	                                <li v-else class="page-item">
	                                    <a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(1)">
	                                        <span aria-hidden="true"><i class="fa fa-fast-backward"></i></span>
	                                        <span class="sr-only">Previous</span>
	                                    </a>
	                                </li>


	                                <li v-if="pagination.currentPage == 1" class="page-item disabled">
	                                    <a class="page-link" href="#" aria-label="Previous">
	                                        <span aria-hidden="true"><i class="fa fa-step-backward"></i></span>
	                                        <span class="sr-only">Previous</span>
	                                    </a>
	                                </li>
	                                <li v-else class="page-item">
	                                    <a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(pagination.currentPage - 1)">
	                                        <span aria-hidden="true"><i class="fa fa-step-backward"></i></span>
	                                        <span class="sr-only">Previous</span>
	                                    </a>
	                                </li>
	                            <!--Botones anteriores-->

	                                <li v-for="(page,index) in getLinksPages" class="page-item" :class="[page === isCurrentPage ? 'active':'' ]">
	                                    <span v-if="page === isCurrentPage" class="page-link">{{ page }}</span>
	                                    <a v-else class="page-link" href="#" @click.prevent="changePage(page)" >{{page}}</a>
	                                </li>

	                            <!--Botones posteriores-->
	                                <li v-if="pagination.currentPage == pagination.lastPage" class="page-item disabled">
	                                    <a class="page-link" href="#" aria-label="Previous">
	                                        <span aria-hidden="true"><i class="fa fa-step-forward"></i></span>
	                                        <span class="sr-only">Next</span>
	                                    </a>
	                                </li>
	                                <li v-else class="page-item">
	                                    <a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.currentPage + 1)">
	                                        <span aria-hidden="true"><i class="fa fa-step-forward"></i></span>
	                                        <span class="sr-only">Next</span>
	                                    </a>
	                                </li>

	                                <li v-if="pagination.currentPage == pagination.lastPage" class="page-item disabled">
	                                    <a class="page-link" href="#" aria-label="Previous">
	                                        <span aria-hidden="true"><i class="fa fa-fast-forward"></i></i></span>
	                                        <span class="sr-only">Next</span>
	                                    </a>
	                                </li>
	                                <li v-else class="page-item">
	                                    <a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.lastPage)">
	                                        <span aria-hidden="true"><i class="fa fa-fast-forward"></i></i></span>
	                                        <span class="sr-only">Next</span>
	                                    </a>
	                                </li>
	                            <!--Botones posteriores-->  
	                            </ul>
	                        </nav>
	                    </div>
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

import moment from 'moment'
export default {

  data:function(){
      return {
        data_users:[],
		users_name:'',

        selectPerPage:10,
        search:'',
        pagination:{
          perPage:10,
          total:0,
          currentPage:1,
          from:0,
          to:0,
          lastPage:0,
          currentUsers:[],
          links:[]
        },

      }
  },

  filters:{
      dateFormat: function(value){
          let fecha = moment(value).format('MM/DD/YYYY');
          return fecha;
      }
  },


  methods:{

	  	EditUser(data){
			this.$router.push({
				name: "user/edit",
				params:{
					data_users: data,
				}
			});
		},

        //Paginacion vue//
        GetUsers(){
              	let me=this;
			  	Swal.fire({
                	title: 'Cargando...',
					allowEscapeKey: false,
					allowOutsideClick: false,
					onOpen: () => {
					swal.showLoading();
					}
            	});
              	axios.get('/get_users').then(function(response){
                me.data_users = response.data;
				swal.close();
          });
        },

        changePage(page){
            this.pagination.perPage=this.selectPerPage;
            this.pagination.currentPage = Number(page);
        },

        onKeySearch(){
            this.changePage(1);
        },
        //End Paginate//

		searchUsers(){
          let me=this;
          axios.get('/user/search_users?users_name='+ me.users_name).then(function(response){
              me.data_users=response.data;
          })
        }

        

  },

  computed:{
      getCurrentUsers(){
          this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
          this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
          return this.data_users.slice(this.pagination.from,this.pagination.to);
      },
      getLinksPages(){
        let cant = this.pagination.total / Number(this.pagination.perPage);
        this.pagination.links=[];
        let cumstom_links=[];
        /*obtiene los numeros de todas las paginas*/
        for ( let i=0 ; i <  cant; i++) {
            this.pagination.links.push(i+1);
        }
        this.pagination.lastPage = this.pagination.links.length;
        let start = 0;
        let limit = 5;
        if (this.pagination.currentPage < 3) {
            start = 0;
            return this.pagination.links.slice(start,limit);
        }else if (this.pagination.currentPage >= 3 && this.pagination.currentPage-1+2 < this.pagination.lastPage){
            start=(this.pagination.currentPage-1)-2;
            limit = start+limit;
            return this.pagination.links.slice(start,limit);
        }else{
            if (this.pagination.links.length == 4) {
                start=0;
                limit = start+limit;
                return this.pagination.links.slice(start,limit);    
            }else{
                start=(this.pagination.lastPage-1)-4;
                limit = start+limit;
                return this.pagination.links.slice(start,limit);
            }
        }
                
      },
      isCurrentPage(){
          return this.pagination.currentPage;
      },
      searchInUsers(){
        let me =this;

        /*me.libros.filter(function(libro){ 
          console.log(libro.libro_nombre.toLowerCase());
        });*/
          if (this.search.length > 0){
              this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
              this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
              this.pagination.total = me.data_users.filter((user) => user.name.toLowerCase().includes(this.search.toLowerCase())).length;
          }else{
              this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
              this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
              this.pagination.total = me.data_users.length;
          }
          return me.data_users.filter((user) => user.name.toLowerCase().includes(this.search.toLowerCase())).slice(this.pagination.from,this.pagination.to);
      }
  },


   mounted() {
    	let self = this
    	self.GetUsers();
  }

  
};
</script>