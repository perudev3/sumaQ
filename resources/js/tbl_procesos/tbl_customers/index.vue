<template>
    <div>
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
                                            <router-link to="/products/create">
                                                <button class="btn btn-primary">
                                                    + Nuevo Cliente
                                                </button>
                                            </router-link>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-4 pull-right">
                                        <div class="form-group tg-inputwithicon">
                                            <i class="icon-magnifier"></i>
                                            <input type="search" class="form-control" placeholder="Nombre, Teléfono o Apellidos"  v-model="search" v-on:keyup="searchProducts">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table id="tg-adstype" class="table table-responsive tg-dashboardtable tg-payments">
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
                                    <tr data-category="packageone" v-for="(data, index) in searchInUsers" :key="index">
                                        <td data-title="Nombre">
                                            <h3>{{data.customers_name}}</h3>
                                        </td>
                                        <td data-title="Email">
                                            <h3>{{data.customers_mail}}</h3>
                                        </td>
                                        <td data-title="Telefono">
                                            <h3>{{data.customers_phone}}</h3>
                                        </td>
                                        <td data-title="Dirección">
                                            <h3>{{data.addresses_first_line}}, {{data.addresses_second_line}}</h3>
                                        </td>
                                        <td data-title="Referencias">
                                            <h3>{{data.addresses_reference}}</h3>
                                        </td>
                                        

                                        <td data-title="Opciones">
                                            <div class="tg-btnsactions">
                                                <a class="tg-btnaction tg-btnactionview" href="javascript:void(0);" @click="editProducto(data)">
                                                    <i class="fa fa-pencil fa-2x"></i>
                                                </a>
                                                <a class="tg-btnaction tg-btnactiondelete" href="javascript:void(0);">
                                                    <i class="fa fa-trash fa-2x"></i>
                                                </a>
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

                                        <li v-for="(page,index) in getLinksPages" class="page-item" :class="[page === isCurrentPage ? 'active':'' ]" :key="index">
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
		
		editProducto(data){
			this.$router.push({
				name: "products/edit",
				params:{
					data_product: data
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