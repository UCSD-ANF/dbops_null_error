# This script demonstrates that using the string
# NULL causes an intermittendly error

use strict;
use Datascope;

my $db = '/opt/antelope/data/db/demo/demo';
my $max = 100;

for( my $i=0; $i < $max; $i++ ) {
    my @db = dbopen($db, 'r');
    my @db_sitechan = dblookup(@db, '', 'sitechan', '', '');
    my @db_deployment = dblookup(@db, '', 'deployment', '', '');
    my @db_joined = dbjoin(@db_sitechan, @db_deployment);
    my @db_sub = dbsubset(@db_joined, 'offdate == NULL');
    print("\nIteration $i\n");
    print @db_sub;
    print("\n");
    dbfree(@db_sub);
    dbfree(@db_deployment);
    dbfree(@db_sitechan);
    dbfree(@db);
    dbclose(@db);
}
exit();
