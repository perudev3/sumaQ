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
                                    <h4>Crear Solicitud</h4>                                                        
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Basic Form Inputs card start -->
                                <div class="card">
                                    <div class="card-block">
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Fecha de Solicitud</span></div>
                                                            <input type="date" disabled  v-model="solictudes_fecha" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Sucursal Solicitante </span></div>
                                                            <input type="text" disabled  :value="user['name']" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>     
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Asunto </span></div>
                                                            <input type="text" v-model="solicitudes_subject" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Seleccion Sucursal </span></div>
                                                            <select class="form-control" v-model="solicitudes_to">
                                                                <option v-for="data in data_sucursals" :value="data.sucursals_id">
                                                                    {{ data.sucursals_name }}
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Seleccion Producto </span></div>
                                                            <select class="form-control" v-model="products_id">
                                                                <option v-for="data in data_products" :value="data.products_id">
                                                                    {{ data.products_name }}
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Cantidad </span></div>
                                                            <input type="text" v-model="cantidad" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"  id="basic-addon1">Mensaje </span></div>
                                                            <textarea v-model="solicitudes_message" class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                </div>                                            
                                            </div>                        
                                            <br><br>
                                            <div class=" ">
                                                <button class="btn btn-primary" type="button" @click="PostSolicitud">Registrar</button>
                                                <router-link :to="{path: '/solicitudes'}">
                                                    <button class="btn btn-danger" type="button" >Cancelar</button>
                                                </router-link>
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
            data_sucursals:[],
            data_products:[],
            hoy: new Date(),  
            solictudes_fecha:'',
            solicitudes_from: this.user['id'],
            solicitudes_to:'',
            solicitudes_subject:'',
            solicitudes_message:'',
            cantidad:'',
            products_id:'',
        }
    },


    methods:{

            GetSucursals(){
                let me=this;
                axios.get('/get_sucursal').then(function(response){
                    me.data_sucursals = response.data;
                });
            },

            GetProductos(){
                let me=this;
                axios.get('/get_products').then(function(response){
                    me.data_products = response.data;
                });
            },

            PostSolicitud(){                    
                    axios.post('/post_solicitudes', {
                        'solicitudes_fecha' : this.solictudes_fecha,
                        'solicitudes_from' : this.solicitudes_from,
                        'solicitudes_to' : this.solicitudes_to,
                        'solicitudes_subject' : this.solicitudes_subject,
                        'solicitudes_message' : this.solicitudes_message,
                        'cantidad':this.cantidad,
                        'products_id': this.products_id,
                    })
                        .then(response => {
                            if (response.data.status==='success') {
                                Swal.fire({
                                    title: response.data.message,
                                    text: 'Solicitud Enviada',
                                    type: 'success',
                                    confirmButtonText: 'OK'
                                });
                                this.$router.replace('/solicitudes');
                            };
                    }).catch(function (error) {
                        console.log(error);
                    });
            },

    },

    mounted() {
        let self = this
        var mes = self.hoy.getMonth()+1; //obteniendo mes
        var dia = self.hoy.getDate(); //obteniendo dia
        var ano = self.hoy.getFullYear(); //obteniendo año
        if(dia<10)
            dia='0'+dia; //agrega cero si el menor de 10
        if(mes<10)
            mes='0'+mes;
        
        var fecha = ano+"-"+mes+"-"+dia;
        self.solictudes_fecha = fecha;
        
        self.GetSucursals();
        self.GetProductos();
    }
  
};
</script>