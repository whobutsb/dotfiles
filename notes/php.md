# PHP Notes

Ideas, notes, and tutorials on php. 

## php.ini

### Articles 

- [dZone - Understanding the php.ini](http://php.dzone.com/articles/understanding-phpini)

## PHP-FPM 

PHP Status page summarizes the pool stats. `http://localhost/status`

#### Enable in PHP-FPM

In the `/etc/php5/fpm/pool.d/www.conf`, find the `pm.status_path` variable.

Default value is `/status`.  You cna change it to something else. 

`pm.status_path = /status`

#### Edit Nginx Config

Edit the nginx site configuration in `/etc/nginx/sites-available/[site-name]`

    location ~ ^/(status|ping)$ {
     access_log off;
     allow 127.0.0.1;
     allow 1.2.3.4#your-ip;
     deny all;
     include fastcgi_params;
     fastcgi_pass 127.0.0.1:9000;
    }

The above limit it to just localhost or a specific ip address. Restart nginx and php-fpm

#### Stats

- **pool** - the name of the pool

- **accepted conn** -  the number of requests accepted by the pool

- **listen queue** - the number of requests in the queue pending connections. **Important** if this number is non-zero, then you better increase number of process FPM can spawn

- **max listen queue** - the maximum number of requests in the queue of pending connections since FPM has started.

- **listen queue len** - the size of the socket queue of pending connections

- **idle processes** - the number of idle processes

- **active processes** - the number of active processes

- **total processes** - the number of idle + active processesk

- **max active processes** - the maximum number of active processes since FPM has started

- **max children reached** - number of times, the process limit has been reached, when pm tries to start more children. If that value is not zero, then you may need to increase max process limit for your PHP-FPM pool. Like this, you can find other useful information to tweak your pool better way.

- **slow requests** - [Enable php-fpm slow-log](https://easyengine.io/tutorials/debugging-php-scripts-using-slow_log-and-more/) before you consider this. If this value is non-zero you may have slow php processes. Poorly written mysql queries are generally culprit.

[EasyEngine.io - Nginx - Enable PHP-FPM Status Page](https://easyengine.io/tutorials/php/fpm-status-page/)


## Profiling 

### [BlackFire](http://blackfire.io) 
Blackfire Profiler automatically instruments your code to gather data about consumed server resources like memory, CPU time, and I/O. But Blackfire Profiler is more than figures; its interactive Callgraphs make it straightforward to find bottlenecks and improve performance. Moreover, profile comparisons let you understand the impact of your changes.

## Disabling Modules

    $ sudo php5dismod [module]
    $ sudo service php5-fpm restart

    ex: sudo php5dismod xdebug

## Testing 

### [PHPUnit](http://phpunit.de)

### [Codeception](http://codeception.com)

## Lint PHP file

	php -l <filename>

## PHPUnit 

Testing private methods with PHPUnit

    protected static function getMethod($class, $name){
        $class = new ReflectionClass($class); 
        $method = $class->getMethod($class); 
        $method->setAccessible(true); 
        return $method; 
    }

    public function testSomething(){
        $foo = self::getMethod('someMethod'); 
        $obj = new SomeClass(); 
        $foo->invokeArgs($obj, ["arg1", "arg2"]); 
    }

## Articles 

- [Scaling expert and former CTO of Twitpic teaches us how to scale our web apps](
http://scaleyourcode.com/interviews/interview/3)
- [6 Rules of thumb to build blazing fast web server applications](http://loige.co/6-rules-of-thumb-to-build-blazing-fast-web-applications/)
- [PROGRAMMING GUIDELINES (FOR PHP DEVELOPERS) - PART 1: REDUCING COMPLEXITY](https://www.ibuildings.nl/blog/2016/01/programming-guidelines-php-developers-part-1-reducing-complexity)
- [PHP Interfaces Explained](https://daylerees.com/php-interfaces-explained/)

_Links_

- [PointNull.com](http://pointnull.com/testing-private-methods-with-phpunit/)
- [Awesome PHP](https://github.com/ziadoz/awesome-php/blob/master/README.md)
