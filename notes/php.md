# PHP Notes

Ideas, notes, and tutorials on php. 

## Profiling 

### [BlackFire](http://blackfire.io) 
Blackfire Profiler automatically instruments your code to gather data about consumed server resources like memory, CPU time, and I/O. But Blackfire Profiler is more than figures; its interactive Callgraphs make it straightforward to find bottlenecks and improve performance. Moreover, profile comparisons let you understand the impact of your changes.

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

_Links_

- [PointNull.com](http://pointnull.com/testing-private-methods-with-phpunit/)
- [Awesome PHP](https://github.com/ziadoz/awesome-php/blob/master/README.md)
