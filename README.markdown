# Case study to show NULL error with Datascope under 5.2-64 on Linux
We have a simple use case that shows that the Perl interface to
Datascope fails when using the 'NULL' string as part of a dbsubset
command with a view that contains a deployment table under Antelope
5.2-64 on Red Hat Linux.

The failure is intermittent so we have a Bash script
(db\_wrapper) that continuously iterates over a series of
dbopens, dbjoins and dbsubsets

## Notes
This does not fail under 5.2-64 on Darwin, nor 5.1-64 on
Red Hat Linux.

## How to replicate this on your localhost
1. Git clone the repo
2. Type 'make'
3. Run ./db_wrapper

## Output you will see
You will see something like:

    $ ./db_wrapper 
    043-501-501-----Completed iteration: 1
    043-501-501-----Completed iteration: 2
    043-501-501-----Completed iteration: 3
    043-501-501-----Completed iteration: 4
    043-501-501-----Completed iteration: 5
    043-501-501-----Completed iteration: 6
    043-501-501-----Completed iteration: 7
    043-501-501-----Completed iteration: 8
    043-501-501-----Completed iteration: 9
    043-501-501-----Completed iteration: 10
    043-501-501-----Completed iteration: 11
    043-501-501-----Completed iteration: 12
    dbsubset 'endtime == NULL' failed: 2012-153 22:36:59 perl *log*: Bad record id 729618461984038944 in db pointer
    2012-153 22:36:59 perl *log*: Can't resolve db pointer in dbgetv: 0 42 15 -505
    2012-153 22:36:59 perl *log*: failed evaluating 'endtime == NULL' at record #3739
    2012-153 22:36:59 perl *log*: failed evaluating 'endtime == NULL' at record #7452
    2012-153 22:36:59 perl *log*: failed evaluating 'endtime == NULL' at record #11178

Note that the record id is always that integer.
