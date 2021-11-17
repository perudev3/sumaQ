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
                                      <div class="wizard-form wizard clearfix" id="basic-forms">
                                          <div class="steps clearfix">
                                            <ul role="tablist">
                                              <li style="width: 50% !important;" role="tab" class="first current" aria-disabled="false" aria-selected="true" align="center">
                                                  <a href="/provider" id="basic-forms-t-0" aria-controls="basic-forms-p-0">
                                                    <span class="current-info audible">current step: </span>
                                                    <span class="number"><i class="fa fa-building fa-3x" aria-hidden="true"></i></span> 
                                                  </a>
                                                  
                                              </li>
                                              <li style="width: 50% !important;" role="tab" class="done" aria-disabled="false" aria-selected="false" align="center">
                                                  <a href="/provider/purchase_orders/lista">
                                                    <span class="number"><i class="fa fa-list fa-3x" aria-hidden="true"></i></span> 
                                                  </a>
                                              </li>
                                            </ul>
                                          </div>
                                          <div class="clearfix" style="margin-top: 50px;">
                                            <fieldset id="basic-forms-p-0" role="tabpanel" aria-labelledby="basic-forms-h-0" class="body current" aria-hidden="false" style="left: 0px;">
                                                <div class="row">	
                                                    <div class="main-body">
                                                        <div class="page-wrapper">
                                                            <!-- Page-header start -->
                                                            <div class="page-header">
                                                                <div class="align-items-end">                                                                  
                                                                  <div class="row">
                                                                      <div class="col-lg-8">
                                                                          <div class="form-group">
                                                                              <label for="">Digite nombre del proveedor</label>
                                                                              <input type="search" class="form-control" v-model="providers_name" v-on:keyup="searchProviders">
                                                                          </div>
                                                                      </div>
                                                                      <div class="col-lg-6">
                                                                          <a href="/provider/create">
                                                                              <button class="btn btn-primary">
                                                                                  + Registrar Proveedor
                                                                              </button>
                                                                          </a>
                                                                      </div>
                                                                  </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                      <!-- Zero config.table start -->
                                                      <div class="card">  
                                                        <div class="card-header">
                                                          <div class="col-lg-4">
                                                                  
                                                          </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="card-block table-border-style">
                                                                <div class="dt-responsive table-responsive">
                                                                  <table class="table">
                                                                      <thead>
                                                                        <tr>
                                                                          <th>Nombre</th>
                                                                          <th>Numero</th>
                                                                          <th>Dirección</th>
                                                                          <th>Encargado</th>
                                                                          <th>Mobile</th>
                                                                          <th>Estado</th>
                                                                          <th>Opciones</th>
                                                                        </tr>
                                                                      </thead>
                                                                      <tbody>
                                                                        <tr v-for="(data, index) in searchInUsers">
                                                                          <td >
                                                                              {{data.providers_name}}
                                                                          </td>
                                                                          <td >
                                                                              {{data.providers_id_number}}
                                                                          </td>
                                                                          <td>
                                                                              {{data.providers_address}}
                                                                          </td>
                                                                          <td >
                                                                              {{data.providers_encargado}}
                                                                          </td>
                                                                          <td >
                                                                              {{data.providers_mobile}}
                                                                          </td>
                                                                          <td  v-if="data.providers_is_active==1">
                                                                              Activo
                                                                          </td>
                                                                          <td  v-if="data.providers_is_active==0">
                                                                              Inactivo
                                                                          </td>
                                                                          <td >
                                                                              <a  @click="EditProviders(data)">
                                                                                <button class="btn btn-primary"><i class="feather icon-edit"></i></button>
                                                                              </a>
                                                                              <a >
                                                                                <button class="btn btn-danger"><i class="feather icon-trash"></i></button>
                                                                              </a>
                                                                            
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
                                                      </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                          </div>
                                      </div>
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


<script>

export default {

  data:function(){
      return {
        data_provider:[],
        providers_name:'',
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

        EditProviders(data){
          this.$router.push({
            name: "provider/edit",
            params:{
              data_provider: data,
            }
          });
        },

        //Paginacion vue//
        GetProviders(){
              let me=this;
              Swal.fire({
                	title: 'Cargando...',
                  allowEscapeKey: false,
                  allowOutsideClick: false,
                  onOpen: () => {
                  swal.showLoading();
                  }
            	});
              axios.get('/get_provider').then(function(response){
                me.data_provider = response.data;
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

        searchProviders(){
          let me=this;
          axios.get('/provider/search_providers?providers_name='+ me.providers_name).then(function(response){
              me.data_provider=response.data;
          })
        }
        

  },

  computed:{
      getCurrentUsers(){
          this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
          this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
          return this.data_provider.slice(this.pagination.from,this.pagination.to);
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
              this.pagination.total = me.data_provider.filter((prov) => prov.providers_name.toLowerCase().includes(this.search.toLowerCase())).length;
          }else{
              this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
              this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
              this.pagination.total = me.data_provider.length;
          }
          return me.data_provider.filter((prov) => prov.providers_name.toLowerCase().includes(this.search.toLowerCase())).slice(this.pagination.from,this.pagination.to);
      }
  },


   mounted() {
            let self = this
            setTimeout(function(){
              self.GetProviders();
            },2000);

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