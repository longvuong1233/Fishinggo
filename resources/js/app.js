/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");

window.Vue = require("vue");




/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

//Vue.component('test-component', require('./components/TestComponent.vue').default);

import menuComponent from "./components/MenuComponent.vue";

import itemComponent from "./components/showItem/itemComponent.vue";
import deleteorderComponent from './components/order/deleteOrderComponent.vue'
import paginationComponent from './components/pagination.vue'

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
import VueEasySession from "vue-easysession";
import { store } from "./components/cart/store";
import { mapGetters } from 'vuex';

// Optionally install the BootstrapVue icon components plugin


var options = {
    persist: false
}
Vue.use(VueEasySession.install, options);

const app = new Vue({
    el: "#app",
    data: {
        key: "1",
        quantity: '1',
        reportOrder: false,
        list: [],
        listRoot: [],
        ajax: false,
        product: {},
        type: {
            '1': 'cayts',
            '2': 'fish',
            '3': 'shr_nail',
            '4': 'light',
            '5': 'aquarium',
            '6': 'tankfilter',
            '7': 'food',
            '8': 'accessories',
        },
        currentPage: 1,
        row: 1,
        perPage: 6


    },
    mounted() {
        // axios.get('/')
        //     .then(response => {
        //         this.list = response.data;
        //     });
    },
    methods: {
        add(id, quantity) {
            for (let i = 0; i < quantity; i++) {
                this.$store.commit('addCart', id);
                this.$session.set(this.key, this.getCart);
            }

        },
        deleteSession() {
            this.$session.remove(this.key);
        },
        callAjax(id) {
            this.ajax = true;
            axios.get("/" + this.type[id]).then(response => {
                let tempt = [];
                Object.values(response.data).forEach(element => {
                    tempt.push(element);
                });
                this.listRoot = tempt;
                this.setList();
            });
        },
        getRoute(id) {
            return this.url = '/products/' + id;
        },
        routeShowProduct(id) {
            this.$store.commit('setShowProduct', true);
            this.ajax = false;
            axios.get('/products/' + id).then(response => {
                this.product = response.data;
            })
        },
        onPageChange(page) {
            this.currentPage = page;
        },
        setList() {
            this.list = [];
            let k = (this.currentPage - 1) * this.perPage;
            let max = k + this.perPage;
            for (let i = k; i < Math.min(max, this.listRoot.length); i++) {
                this.list.push(this.listRoot[i]);
            }
        }
    },
    created() {
        this.$session.start(1800000);
        if (this.$session.get(this.key)) {
            this.$session.get(this.key).forEach(element => {
                this.$store.commit('addCart', element);
            });

        }


    },
    watch: {
        getCart() {
            this.$session.set(this.key, this.getCart);
        },
        getProduct() {
            this.ajax = true;
            this.listRoot = this.getProduct;
            this.currentPage = 1;
            this.setList();
        },
        currentPage() {
            this.setList();
        },
        listRoot() {
            this.row = Math.ceil(this.listRoot.length / this.perPage);
        }

    },
    store,
    components: {
        menuComponent,
        itemComponent,
        deleteorderComponent,
        paginationComponent
    },
    computed: {
        ...mapGetters(['getCart', 'getProduct', 'getShowProduct'])
    }
});