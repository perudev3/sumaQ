<template>

    <div class="pcoded-content">
        <transition name="modal" v-if="modal">
		    <div class="modal-mask">
		        <div class="modal-wrapper">
		            <div class="modal-container">

                        <div class="modal-header col-xl-12">
                            <slot name="header">
                                Detalles de la solicitud
                            </slot>
                        </div>

                        <div class="modal-body">
                            <slot class="name body">
                                <div class="form">
                                    <p>Fecha :  {{data_modal.solictudes_fecha }} </p>
                                    <p>Asunto : {{ data_modal.solicitudes_subject }}</p>
                                    <p>Mensaje : {{ data_modal.solicitudes_message }}</p>
                                </div>
                            </slot>
                        </div>

                        <div class="modal-footer">
                            <slot name="footer">
                                <button class="btn btn-primary" @click="Cerrar">Cerrar</button>
                            </slot>
                        </div>

                    </div>
                </div>
            </div>
        </transition>
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">
                    <div class="page-header">
                        <div class="row align-items-end">
                            <div class="col-lg-8">
                            	<div class="page-header-title">
                                    <div class="d-inline">
                                        <h4>SOLICITUDES</h4>
                                    </div>
                            	</div>
                            </div>
                        </div>
                    </div>
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
                                                            <li style="width: 50% !important;" role="tab" class="done" aria-disabled="false" aria-selected="true" align="center">
                                                                <a href="/solicitudes" id="basic-forms-t-0" aria-controls="basic-forms-p-0">
                                                                    <span class="current-info audible">current step: </span>
                                                                    <span class="number"><i class="fa fa-list fa-3x" aria-hidden="true"></i></span> 
                                                                </a>
                                                                
                                                            </li>
                                                            <li style="width: 50% !important;" role="tab"   class="first current" aria-disabled="false" aria-selected="false" align="center">
                                                                <a href="/solicitante">
                                                                    <span class="number"><i class="fa fa-check-circle fa-3x" aria-hidden="true"></i></span> 
                                                                </a>
                                                            </li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix" style="margin-top: 50px;">
                                                            <div class="col-sm-12">                                
                                                                <div class="card">
                                                                    <div class="card-block">
                                                                        <div class="card-block table-border-style">
                                                                            <div class="dt-responsive table-responsive">
                                                                                <table class="table">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Solicitante</th>
                                                                                            <th>Fecha</th>
                                                                                            <th>Asunto</th>
                                                                                            <th>Producto</th>
                                                                                            <th>Cantidad</th>
                                                                                            <th>Opciones</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>

                                                                                        <tr  v-for="(data, index) in searchInUsers">
                                                                                            <td>
                                                                                                {{ data.to.sucursals_name  }}
                                                                                            </td>
                                                                                            <td>
                                                                                                {{ data.solictudes_fecha }}
                                                                                            </td>                                                                                            
                                                                                            <td>
                                                                                                {{ data.solicitudes_subject }}
                                                                                            </td>
                                                                                            <td>
                                                                                                {{ data.products.products_name }}
                                                                                            </td>
                                                                                            <td>
                                                                                                {{ data.cantidad }}
                                                                                            </td>
                                                                                            <td>
                                                                                                <button class="btn btn-success" @click="SolicitudDetails(data)"><i class="feather icon-eye"></i></button>
                                                                                                
                                                                                                <button class="btn btn-danger" @click="Transferir(data)"><i class="feather icon-check"></i></button>                                                                
                                                                                            </td>
                                                                                        </tr>

                                                                                    </tbody>
                                                                                    <tfoot>
                                                                                        <div class="card-footer" style="background-color: rgb(0 0 0 / 0%) !important;border-top: 1px solid rgb(255 255 255 / 13%) !important;">
                                                                                                            <nav aria-label="Page navigation" class="float-left">
                                                                                                                <ul class="pagination">
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

                                                                                                                    <li v-for="(page,index) in getLinksPages" class="page-item" :class="[page === isCurrentPage ? 'active':'' ]">
                                                                                                                        <span v-if="page === isCurrentPage" class="page-link">{{ page }}</span>
                                                                                                                        <a v-else class="page-link" href="#" @click.prevent="changePage(page)" >{{page}}</a>
                                                                                                                    </li>

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

    props:['user'],

    data:function(){
      return {
        data_solicitudes:[],
        modal:0,
        data_modal:[],
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

	  	SolicitudDetails(data=[]){
              this.data_modal = data;
              this.modal = 1;
        },

        Cerrar(){
            this.modal=0;
        },

        Transferir(data=[]){
			let me=this;
            axios.post('/tranferencia_inventorie', {
				'sucursals_id' : data.solicitudes_from,
				'quanty' : data.cantidad,
				'products_id' : data.products_id
			}).then(function(response){
                console.log(response.data);
          	});
		},

        
        //Paginacion vue//
        GetSolicitudes(){
              	let me=this;
              	axios.get('/get_solicitante').then(function(response){
                me.data_solicitudes = response.data;
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

		searchCategory(){
          let me=this;
          axios.get('/category/search_category?categories_name='+ me.categories_name).then(function(response){
              me.data_solicitudes=response.data;
          })
        }

        

  },

  computed:{
      getCurrentUsers(){
          this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
          this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
          return this.data_solicitudes.slice(this.pagination.from,this.pagination.to);
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
              this.pagination.total = me.data_solicitudes.filter((solic) => solic.solictudes_fecha.toLowerCase().includes(this.search.toLowerCase())).length;
          }else{
              this.pagination.from = (this.pagination.currentPage-1)*this.pagination.perPage;
              this.pagination.to = Number(this.pagination.from) + Number(this.pagination.perPage);
              this.pagination.total = me.data_solicitudes.length;
          }
          return me.data_solicitudes.filter((solic) => solic.solictudes_fecha.toLowerCase().includes(this.search.toLowerCase())).slice(this.pagination.from,this.pagination.to);
      }
  },


   mounted() {
    	let self = this
    	self.GetSolicitudes();
  }

  
};
</script>

<style>
    .modal-mask {
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: table;
    transition: opacity 0.3s ease;
    }

    .modal-wrapper {
    display: table-cell;
    vertical-align: middle;
    }

    .modal-container {
    width: 30%;
    margin: 0px auto;
    padding: 20px 30px;
    background-color: #fff;
    border-radius: 2px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
    transition: all 0.3s ease;
    font-family: Helvetica, Arial, sans-serif;
    }

    .modal-header h3 {
    margin-top: 0;
    color: #42b983;
    }

    .modal-body {
    margin: 20px 0;
    }

    .modal-default-button {
    float: right;
    }

    /*
    * The following styles are auto-applied to elements with
    * transition="modal" when their visibility is toggled
    * by Vue.js.
    *
    * You can easily play with the modal transition by editing
    * these styles.
    */

    .modal-enter {
    opacity: 0;
    }

    .modal-leave-active {
    opacity: 0;
    }

    .modal-enter .modal-container,
    .modal-leave-active .modal-container {
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    }

</style>
