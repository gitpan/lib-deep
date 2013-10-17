# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl lib-deep.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
no warnings 'redefine';

use Test::More tests => 4;
BEGIN { require_ok('lib::deep') };
use lib::abs ();

my $r;
my $is = \&is;
*lib::abs::import = sub { $r = $_[1]; };
{ package A; lib::deep->import(); $is->( $r,  '.' ) };
{ package A::B; lib::deep->import(); $is->($r,  '..' ) };
{ package A::B::C; lib::deep->import(); $is->( $r, '../..' ) };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

