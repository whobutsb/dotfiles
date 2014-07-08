
# PHP Notes

Ideas, notes, and tuorials on php. 

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

_Links_

- [PointNull.com](http://pointnull.com/testing-private-methods-with-phpunit/)
