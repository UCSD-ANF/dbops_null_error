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
my @db_snetsta = dblookup(@db, '', 'snetsta', '', '');
my @db_deployment = dblookup(@db, '', 'deployment', '', '');

# Make a join between sitechan and snetsta:
my @db_joined1 = dbjoin(@db_sitechan, @db_snetsta);

# Make a join to the deployment table:
my @db_joined2 = dbjoin(@db_joined1, @db_deployment);

# Here's the choose your own adventure part: pick one of the four
# dbsubset calls below

# Subset on endtime using NULL string
# This will cause the error
my @db_sub = dbsubset(@db_joined2, 'endtime == NULL');

# Same thing as above, but use the null value for endtime from the schema
# This one won't cause the error
#my @db_sub = dbsubset(@db_joined2, "endtime == '-9999999999.99900'");

# Subset on offdate using NULL
# This will cause the error.
#my @db_sub = dbsubset(@db_joined2, 'offdate == NULL');

# Same thing as above, but use the null value for offdate from the schema
# This won't cause the error either
#my @db_sub = dbsubset(@db_joined2, "offdate == '-1'");



print @db_sub;

dbfree(@db_sub);
dbfree(@db_joined1);
dbfree(@db_joined2);
dbfree(@db_deployment);
dbfree(@db_sitechan);
dbclose(@db);
exit();
