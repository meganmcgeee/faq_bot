import App from './App.vue'
import Vue from 'vue'
import VueFrame from 'vue-frame'

new Vue({
  el: '#app',
  render: h => h(App)
}).$mount('#app')

// export default {
//   components: { VueFrame },
//   data() {
//     return { /*...*/ }
//   },
//   methods: { /*...*/ }
// }