use strict;
use warnings;

package Foo;

package Bar;
use Foo;        # kaboom - Foo hasn't been defined yet!
sub bar { print "this is the bar sub!\n"; }

package main;
Bar::bar;
