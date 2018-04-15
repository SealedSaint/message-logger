import Vue from 'vue';
import VueResource from 'vue-resource';

import App from './App.vue';
import devConfig from './config.dev.js';

// Internalize the app's configuration settings
let config;
if (window.config) {
  config = { ...window.config };
  delete window.config;
} else {
  console.error('No config present. Unless this is dev, the app will most likely not function.');
  config = devConfig;
}

console.log('Config is: ', config);

// Set the config as an instance property for all components
Vue.prototype.$config = config;

// Middleware
Vue.use(VueResource);

new Vue({
  el: '#app',
  render: h => h(App),
});
