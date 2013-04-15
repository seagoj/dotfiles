<html>
    <h1>HTML: functional.</h1>
<?php
print "<h1>PHP: functional</h1>";

require_once('../lib/Predis/autoloader.php');
Predis\Autoloader::register();

$redis = new Predis\Client();
$redis->set('foo', 'bar');
$value = $redis->get('foo');

if($redis) {
    print "<h1>Redis connection: Live</h1>";
}
else {
    print "<h1>Redis Connection: Failed</h1>";
    die();
}

$redis->hset('test','foo','bar');
if($redis->hget('test','foo')=='bar') {
    print "Data entry/retrival test successful";
}

print "<h1>It's alive!!</h1>";

?>
</html>
