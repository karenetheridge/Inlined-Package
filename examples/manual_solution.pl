use strict;
use warnings;

package Foo;
1;

package Bar;
BEGIN { $INC{"Foo.pm"} = __FILE__; }    # look for Foo in this file
use Foo;
sub bar { print "this is the bar sub!\n"; }

package main;
Bar::bar;

