# This script demonstrates that using the string
# NULL causes an intermittendly error

use strict;
use Datascope;

my($db, @db, $max, $i, $dbnrecs);

$db = '/opt/antelope/data/db/demo/demo';
$max = 100;

for( $i=0; $i < $max; $i++ ) {
    @db = dbopen($db, 'r');
    @db = dblookup(@db, '', 'sitechan', '', '');
    $dbnrecs = dbquery(@db, 'dbRECORD_COUNT');
    @db = dbsubset(@db, 'offdate == NULL');
    print("\nIteration $i\n");
    print @db;
    print("\n");
    dbfree(@db);
    dbclose(@db);
}
exit();
