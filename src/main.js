import App from './App.vue'
import { Chrome } from 'vue-color'
import Vue from 'vue'

new Vue({
  el: '#app',
  components: {
    'chrome-picker': chrome,
  },
  data() {
    return {
      colors
    }
  }
})

new Vue({
  el: '#app',
  render: h => h(App)
}).$mount('#app')

