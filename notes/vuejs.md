# VueJS

## [vue-cli](https://github.com/vuejs/vue-cli)

Templates a VueJS project. Available templates: 

- **browserify** - A full-featured Browserify + vueify setup with hot-reload, linting & unit testing.
- **browserify-simple** - A simple Browserify + vueify setup for quick prototyping.
- **webpack** - A full-featured Webpack + vue-loader setup with hot reload, linting, testing & css extraction.
- **webpack-simple** - A simple Webpack + vue-loader setup for quick prototyping.

        $ vue init <template-name> <project-name>

## Computed Values

Use computed values to watch for changes of different values and run expressions on them.

    <template>
        {{ fullname }}
    <template>

    <script>
    new Vue({
        data : {
            firstname: 'Steve', 
            lastname: 'Barbera',
            fullname: ''
        },
        computed: {
            fullname: function(){
                return this.firstname + ' ' + this.lastname;
            }
        }
    });
    </script>

## Iteration

    <template>
        <div id="app">
            <div v-for="plan in plans">
                <plan :plan="plan"></plan> 
            </div>
        </div>
    </template>

    <template id="plan-template">
    <div>
      <span>{{ plan.name }}</span>
      <span>{{ plan.price }} /month</span>
    </div>
    </template>

    <script>
    new Vue({
      el: '#app',
      components: {
        plan: {
          template: '#plan-template',
          props: ['plan']
        }
      },
      data: {
        plans: [
            { name: 'enterprise', price: 100 },
            { name: 'pro', price: 50 },
            { name: 'personal', price: 10 },
            { name: 'free', price: 0 }
          ]
      }
    });
    </script>

## Writing Vue Directives

Writing a auto focus directive

```
Vue.directive('autofocus', function() {
    Vue.nextTick(function(){
        this.el.focus();
    }.bind(this))
});
```

Applying to your input

    <input type="text" v-model="email" placeholder="Email Address" v-autofocus>



## Links

- [Bootstrap Material Design](http://posva.net/vue-mdl/)
- [Hacker News Clone](https://github.com/vuejs/vue-hackernews)
- [JWT App](https://auth0.com/blog/2015/11/13/build-an-app-with-vuejs/)
- [Awesome VueJS](https://github.com/vuejs/awesome-vue#tutorials)
- [Vue Router Webpack Demo](https://github.com/ecrmnn/vue-router-webpack-demo/)
