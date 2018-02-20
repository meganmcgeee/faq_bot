import * as firebase from "firebase";

import App from './App.vue'
import Vue from 'vue'
import VueFire from 'vuefire'

// var db = firebaseApp.database()
// explicit installation required in module environments

Vue.use(VueFire)
// Dialogflow API and front end
new Vue({
  el: '#app',
  render: h => h(App)
}).$mount('#app')

// Firebase/ Vuefire App Setup

// new Vue({
//   el: '#user-data',
//   firebase: function () {
//     return {
//       anArray: db.ref('users')
//     }
//   }
// })