# This script demonstrates that using the string
# NULL causes an intermittendly error

use strict;
use Datascope;

my $db = '/opt/antelope/data/db/demo/demo';

my @db = dbopen($db, 'r');
my @db_sitechan = dblookup(@db, '', 'sitechan', '', '');
my @db_deployment = dblookup(@db, '', 'deployment', '', '');
my @db_joined = dbjoin(@db_sitechan, @db_deployment);
my @db_sub = dbsubset(@db_joined, 'offdate == NULL');

print @db_sub;

dbfree(@db_sub);
dbfree(@db_joined);
dbfree(@db_deployment);
dbfree(@db_sitechan);
dbclose(@db);
exit();
