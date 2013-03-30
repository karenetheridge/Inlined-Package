use strict;
use warnings FATAL => 'all';

use Test::More;
use Test::Warnings;

{
    package Foo;
    sub foo { return 3 * shift }

    package Bar;
    use Inlined::Package 'Foo';
    sub bar { return 2 * Foo::foo(shift) }
}

is(Bar::bar(5), 30, 'Foo can find the Bar package later in its own file');

done_testing;
