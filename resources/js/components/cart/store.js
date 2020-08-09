window.Vue = require('vue');
import Vuex from 'vuex'
Vue.use(Vuex)

export const store = new Vuex.Store({
    state: {
        cart: [],
        product: [],
        type: '',
        showProduct: false
    },
    getters: {
        getCart: state => {
            return state.cart;
        },
        getProduct: state => {
            return state.product;
        },
        getShowProduct: state => {
            return state.showProduct;
        }
    },
    mutations: {
        addCart(state, item) {
            if (typeof(item) == 'Array') {
                array.forEach(element => {
                    state.cart.push(element);
                });
            } else {
                state.cart.push(item);
            }

        },
        checkCart(state, params) {

            let count = 0;
            state.cart.forEach(element => {
                if (element == params[0]) {
                    count++;
                }
            });

            if (count < params[1]) {
                for (let i = 0; i < params[1] - count; i++) {
                    state.cart.push(params[0]);

                }
            } else if (count > params[1]) {
                for (let i = 0; i < count - params[1]; i++) {
                    let index_delete = state.cart.indexOf(params[0]);
                    state.cart.splice(index_delete, 1);
                }
            }
        },
        addProduct(state, param) {
            state.product = param;
        },
        addType(state, param) {
            state.type = param;
        },
        setShowProduct(state, param) {
            state.showProduct = param;
        }
    }
})