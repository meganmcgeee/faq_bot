import App from './App.vue'
import Vue from 'vue'

new Vue({
  el: '#app',
  render: h => h(App)
}).$mount('#app')

// Vue.component('modal', {
//   template: '#modal-template',
//   props: {
//     show: {
//       type: Boolean,
//       required: true,
//       twoWay: true
//     }
//   }
// });

// new Vue({
//   el: '#modal-app',
//   data: {
//     showModal: false
//   }
// });