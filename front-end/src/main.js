import { createApp } from 'vue'
import App from './App.vue'
const app = createApp(App);
import 'bootstrap/dist/css/bootstrap.css'
import "bootstrap/dist/js/bootstrap.js"
import axios from 'axios'
import VueAxios from 'vue-axios'
import './plugins/chart.js'
import VueChartkick from 'vue-chartkick'
import 'chartkick/chart.js'
app.use(VueChartkick)
app.use(VueAxios, axios)
import router from './router'
app.use(router);

app.mount('#app')