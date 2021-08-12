require('./bootstrap');
window.Vue = require('vue');


import VueRouter from 'vue-router';

Vue.use(VueRouter);

const routes = [
    {
        path:'/',
        component: require('./Dashboard.vue').default
    },
    {
        path:'/inicio',
        component: require('./index.vue').default
    },
/***Category***/
    {
        path:'/category',
        component: require('./master_tables/mae_category/index.vue').default
    },

    {
        path:'/category/create',
        component: require('./master_tables/mae_category/create.vue').default
    },

    {
        path:'/category/edit',
        name:'category/edit',
        component: require('./master_tables/mae_category/edit.vue').default
    },

/***Customer***/

    {
        path:'/customers',
        component: require('./tbl_procesos/tbl_customers/index.vue').default
        
    },

/***Collection***/
    {
        path:'/collection',
        component: require('./master_tables/mae_collections/index.vue').default
    },

    {
        path:'/collection/create',
        component: require('./master_tables/mae_collections/create.vue').default
    },

    {
        path:'/collection/edit',
        name:'collection/edit',
        component: require('./master_tables/mae_collections/edit.vue').default
    },
/***Discount***/
    {
        path:'/discount',
        component: require('./master_tables/mae_discounts/index.vue').default
    },

    {
        path:'/discount/create',
        component: require('./master_tables/mae_discounts/create.vue').default
    },

    {
        path:'/discount/create_group',
        component: require('./master_tables/mae_discounts/create_group.vue').default
    },

    {
        path:'/discount/edit',
        name:'discount/edit',
        component: require('./master_tables/mae_discounts/edit.vue').default
    },
/***Material***/
    {
        path:'/material',
        component: require('./master_tables/mae_materials/index.vue').default
    },

    {
        path:'/material/create',
        component: require('./master_tables/mae_materials/create.vue').default
    },

    {
        path:'/material/edit',
        name:'material/edit',
        component: require('./master_tables/mae_materials/edit.vue').default
    },
/***Sucursal***/
    {
        path:'/sucursal',
        component: require('./master_tables/mae_sucursals/index.vue').default
    },

    {
        path:'/sucursal/create',
        component: require('./master_tables/mae_sucursals/create.vue').default
    },

    {
        path:'/sucursal/edit/:sucursals_id',
        component: require('./master_tables/mae_sucursals/edit.vue').default
    },

/***Provider***/
    {
        path:'/provider',
        component: require('./master_tables/mae_providers/index.vue').default
    },
    {
        path:'/provider/create',
        component: require('./master_tables/mae_providers/create.vue').default
    },
    {
        path:'/provider/edit',
        name:'provider/edit',
        component: require('./master_tables/mae_providers/edit.vue').default
    },
    {
        path:'/provider/purchase_orders/lista',
        component: require('./master_tables/mae_providers/purchase_order_list.vue').default
    },
    {
        path:'/purchase_orders/create',
        component: require('./master_tables/mae_providers/purchase_order.vue').default
    },

/***Sales***/
    {
        path:'/sales/pedidos',
        name:'sales/pedidos',
        component: require('./master_tables/tbl_sales/procesos_sales/index.vue').default
    },
    {
        path:'/sales/compra',
        name:'sales/compra',
        component: require('./master_tables/tbl_sales/procesos_sales/compra.vue').default
    },
    {
        path:'/sales/pago',
        name:'sales/pago',
        component: require('./master_tables/tbl_sales/procesos_sales/pago.vue').default
    },
    {
        path:'/sales/finish_sales',
        name:'sales/finish_sales',
        component: require('./master_tables/tbl_sales/procesos_sales/finish_sales.vue').default
    },
    {
        path:'/sales/details',
        name:'sales/details',
        component: require('./master_tables/tbl_sales/details.vue').default
    },

/***Sales***/
{
    path:'/sales/report',
    name:'sales/report',
    component: require('./tbl_procesos/tbl_sales_reports/index.vue').default
},
/***Products***/
    {
        path:'/products',
        component: require('./tbl_procesos/tbl_products/index.vue').default
    },
    {
        path:'/products/create',
        component: require('./tbl_procesos/tbl_products/create.vue').default
    },
    {
        path:'/products/edit',
        name:'products/edit',
        component: require('./tbl_procesos/tbl_products/edit.vue').default
    },

/***Inventario***/
    {
        path:'/inventory',
        component: require('./tbl_procesos/tbl_inventories/index.vue').default
    },
    {
        path:'/inventory/details/:products_id',
        component: require('./tbl_procesos/tbl_inventories/details.vue').default
    },
    {
        path:'/inventory/add/:products_id',
        component: require('./tbl_procesos/tbl_inventories/add.vue').default
    },
/***Users***/
    {
        path:'/user',
        component: require('./master_tables/mae_user/index.vue').default
    },
    {
        path:'/user/create',
        component: require('./master_tables/mae_user/create.vue').default
    },
    {
        path:'/user/edit',
        name:'user/edit',
        component: require('./master_tables/mae_user/edit.vue').default
    },
]

const router = new VueRouter({
    routes: routes,
    mode: "history"
})

const app = new Vue({
    router
}).$mount('#app');