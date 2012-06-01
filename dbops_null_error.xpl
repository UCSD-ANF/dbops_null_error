# This script demonstrates that using the string
# NULL causes an intermittendly error

use strict;
use Datascope;

# This is a local demo dbdescriptor file that
# loads the Antelope demo database, plus a
# custom made deployment table local to this dir

my $db = 'usarray';

# Open up some pointers
my @db = dbopen($db, 'r');
my @db_sitechan = dblookup(@db, '', 'sitechan', '', '');
my @db_deployment = dblookup(@db, '', 'deployment', '', '');
my @db_snetsta = dblookup(@db, '', 'snetsta', '', '');

# Make a join to the deployment table:
my @db_joined = dbjoin(@db_sitechan, @db_deployment);

# Either of these causes the sporadic failure:
# my @db_sub = dbsubset(@db_joined, 'offdate == NULL');
my @db_sub = dbsubset(@db_joined, 'endtime == NULL');

print @db_sub;

dbfree(@db_sub);
dbfree(@db_joined);
dbfree(@db_deployment);
dbfree(@db_sitechan);
dbclose(@db);
exit();
