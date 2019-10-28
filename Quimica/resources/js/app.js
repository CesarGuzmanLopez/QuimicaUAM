/**
 * First we will load all of this project's JavaScript dependencies which
 * includes React and other helpers. It's a great starting point while
 * building robust, powerful web applications using React + Laravel.
 */

/**
 * Next, we will create a fresh React component instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import BootstrapVue from 'bootstrap-vue'


window.Vue = require('vue');
Vue.use(BootstrapVue)
window.axios = require('axios');

//... configure axios...

Vue.prototype.$http = window.axios;

Vue.component('examplecomponent',  require('./components/example.vue').default);
Vue.component('tabla',  require('./components/TablaModelo.vue').default);





const app = new Vue({
    el: '#app',
    data: {
    	mensaje: 'otro',
    	titulo:'valores defecto',	
    	otro:  'asdf',
    	quien: '324',
    	este:   1324,
    }
});

