import Vue from 'vue'
import App from './App.vue'
import axios from 'axios';
import VueAxios from 'vue-axios';
Vue.use(VueAxios,axios);

Vue.config.productionTip = false

let t = new Vue({

  render: h => h(App),
}).$mount('#app')

