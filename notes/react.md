# [React](http://facebook.github.io/react/)

[React Native](https://facebook.github.io/react-native/)

## Components

### State

The internal data store (object) of a component.

Use states to hold the current value of an item.  Used if the value could
change. Set the initial state with `getInitialState`.  Use `this.setState()`,
to change the current state. Mutable.

    getInitialState: function(){
        return { count: 0 }
    },
    add: function(){
        this.setState({
            count: this.state.count + 1;
        });
    }

### Properites (*Props*)

The data which is passed to the child component from the parent component.
Props are immutable.  Used to pass data down from your view-controller.
Use this to pass data to child components.

Set default properties if there is none

    var Testing = React.createClass({
      getDefaultProps: function(){
        return {
          foo: 'something'
        };
      },
      render: function(){
        return {
          <div>
            {this.props.foo}
          </div>
        }
      }
    });

    React.render(<Testing foo="other thing" />, document.body);

### Lifecycle

- `componentWillMount` - Fired before the component will mount.

- `componentDidMount` - Fired after the component mounted.

- `componentWillReceiveProps` - Fired whenever there is a change to props.

- `componentWillUnmount` - Fired before the component will unmount.

## Mapping Over an Array of items

    var TaskList = React.createClass({
        remove: function(i){
            this.props.delete(i);
        },
        render: function(){

            var displayTask = (task, i) => <li onClick={this.remove.bind(this, i)}>{task}</li>;

            return (
                <ul>
                { this.props.items.map(displayTask) }
                </ul>
            );
        }
    });

## JSX Gotchas

### `render()`

`render()`, there must be exactly one outer-most tag inside `return(...)`.

This will **not** work

    return (
        Hello World!
    );

This will work

    return (
        <div>Hello World</div>
    );

### DOM `className`

To set a dom class you need to use `className` and not `class`.
[Why do I have to use "className" instead of "class" in ReactJs components done in JSX?](https://www.quora.com/Why-do-I-have-to-use-className-instead-of-class-in-ReactJs-components-done-in-JSX)

## Gulp File Example

This Gulpfile will watch the javascript files and compile with Babel and React

Run this in terminal to install dependencies

    $ npm install gulp browserify babelify vinyl-source-stream --save-dev

Browserify needs to be downgraded to 6.4.0 in order to work.

```
var gulp = require('gulp');
var browserify = require('browserify');
var babelify = require('babelify');
var source = require('vinyl-source-stream');

gulp.task('browserify', function() {
    return browserify('./js/app.js')
        .transform(babelify)
        .bundle()
        .on('error', function(e){
            console.log(e.message);
            this.emit('end');
        })
        .pipe(source('bundle.js'))
        .pipe(gulp.dest('js'));
});

gulp.task('watch', function(){
    gulp.watch('**/*.js', ['browserify']);
});
```

To run use: `$ gulp browserify`

Now classes can be exported: 

    var Gist = React.createClass({
        render: function(){
            return (
                <div>
                    {this.props.username} last gist is <a href={this.props.url}>here</a>
                </div>
            );
        }
    });

    export default Gist;

And used in the `app.js`

```
import Gist from './components/Gist';
React.render(<Gist />, document.querySelector('#app'));
```



## Tutorials

- [React.js Introduction For People Who Know Just Enough jQuery To Get By](http://reactfordesigners.com/labs/reactjs-introduction-for-people-who-know-just-enough-jquery-to-get-by)

## Links

- [React Awesome](https://github.com/enaqx/awesome-react)
- [Setting Up Vim for React](https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015)
