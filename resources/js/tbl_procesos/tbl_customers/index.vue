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
                                        <h4>CLIENTES</h4>
                                    </div>
                            	</div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->

                    <!-- Page-body start -->
                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Zero config.table start -->
                                <div class="card">
                                    <div class="card-block">
                                        <div class="card-block table-border-style">
                                            <div class="dt-responsive table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Email</th>
                                                            <th>Teléfono</th>
                                                            <th>Dirección</th>
                                                            <th>Referencias</th>
                                                            <th>Opciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <tr v-for="(data, index) in searchInUsers" :key="index">
                                                            <td data-title="Nombre">
                                                                {{data.customers_name}}
                                                            </td>
                                                            <td data-title="Email">
                                                                {{data.customers_mail}}
                                                            </td>
                                                            <td data-title="Telefono">
                                                                {{data.customers_phone}}
                                                            </td>
                                                            <td data-title="Dirección">
                                                                {{data.addresses_first_line}}, {{data.addresses_second_line}}
                                                            </td>
                                                            <td data-title="Referencias">
                                                                {{data.addresses_reference}}
                                                            </td>
                                                            <td>
                                                                <a @click="customer_details(data.customers_id)">
                                                                    <button class="btn btn-success"><i class="feather icon-eye"></i></button>
                                                                </a>															
                                                                <a href="javascript:void(0);">
                                                                    <button class="btn btn-danger"><i class="feather icon-trash"></i></button>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                    <tfoot>
                                                        <div class="card-footer" style="background-color: rgb(0 0 0 / 0%) !important;border-top: 1px solid rgb(255 255 255 / 13%) !important;">
                                                                            <nav aria-label="Page navigation" class="float-left">
                                                                                <ul class="pagination">
                                                                                <!--Botones anteriores-->
                                                                                    <li v-if="pagination.currentPage == 1" class="page-item disabled">
                                                                                        <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-left"></i></span>
                                                                                            <span class="sr-only">Previous</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(1)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-left"></i></span>
                                                                                            <span class="sr-only">Previous</span>
                                                                                        </a>
                                                                                    </li>


                                                                                    <li v-if="pagination.currentPage == 1" class="page-item disabled">
                                                                                        <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-left"></i></span>
                                                                                            <span class="sr-only">Previous</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Previous" @click.prevent="changePage(pagination.currentPage - 1)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-left"></i></span>
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
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-right"></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.currentPage + 1)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevron-right"></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>

                                                                                    <li v-if="pagination.currentPage == pagination.lastPage" class="page-item disabled">
                                                                                        <a class="page-link" href="#" aria-label="Previous">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-right"></i></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li v-else class="page-item">
                                                                                        <a class="page-link" href="#" aria-label="Next" @click.prevent="changePage(pagination.lastPage)">
                                                                                            <span aria-hidden="true"><i class="feather icon-chevrons-right"></i></i></span>
                                                                                            <span class="sr-only">Next</span>
                                                                                        </a>
                                                                                    </li>
                                                                                <!--Botones posteriores-->  
                                                                                </ul>
                                                                            </nav>
                                                        </div>
                                                    </tfoot>
                                                </table>
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

<script>
export default {

    data:function(){
      return {
      	data_products:[],
		search:'',
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


    methods:{

        //Paginacion vue//
        GetClientes(){
              let me=this;
              axios.get('/get_customers').then(function(response){
                me.data_products = response.data;
                console.log(me.data_products);
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
        
		searchProducts(){
          let self = this;
          axios.get('/search_customers?search='+ self.search).then(function(response){
              self.data_products=response.data;
              console.log(response.data);
          })
		},

        customer_details(customers_id){
            this.$router.push({
                name:"customers/customer_details",
                params:{
					customers_id: customers_id
				}
            });
        }

  },
  computed:{
      getCurrentUsers(){
          this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
          this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
          return this.data_products.slice(this.pagination.from,this.pagination.to);
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

        
          if (this.search.length > 0){
              this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
              this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
              this.pagination.total = me.data_products.filter(
                    (prod) => prod.customers_name.toLowerCase().includes(this.search.toLowerCase()) || prod.customers_phone.toLowerCase().includes(this.search.toLowerCase()) ||
                              prod.customers_mail.toLowerCase().includes(this.search.toLowerCase())
                  ).length;
          }else{
              this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
              this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
              this.pagination.total = me.data_products.length;
          }

          return me.data_products.filter(
                    (prod) => prod.customers_name.toLowerCase().includes(this.search.toLowerCase()) || prod.customers_phone.toLowerCase().includes(this.search.toLowerCase()) ||
                              prod.customers_mail.toLowerCase().includes(this.search.toLowerCase())
                ).slice(this.pagination.from,this.pagination.to);

          //return me.data_products;
      }
  },
   mounted() {
            let self = this
            setTimeout(function(){
              self.GetClientes();
            },1000);

  }
    
}
</script>