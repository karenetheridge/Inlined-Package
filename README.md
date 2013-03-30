# NAME

Inlined::Package - EXPERIMENTAL - define multiple packages in one file, and reference them in any order

# VERSION

version 0.001

# SYNOPSIS

If you've ever defined multiple packages in the same file, but want to `use`
one package in another, you'll have discovered why it's much
easier to simply follow best practices and define one package per file.

However, this module will let you minimize your inode usage:

    package Foo;
    sub bar { print "this is the foo sub!\n"; }

    package Bar;
    use Inlined::Package 'Foo';     # no kaboom!

    1;

Simply change `use Foo` to `use Inlined::Package 'Foo'` and you can
(probably) safely define and use packages in any order.

This module is for demonstration purposes only, and in no way am I
recommending you use this in any production code whatsoever.

# FUNCTIONS/METHODS

There is no public API other than the `use` directive itself, which is passed
the name of the module that you want to `use` immediately.

# CAVEATS

There may be edge cases where this doesn't work right, or leads to infinite
looping when trying to compile modules. Use at your own risk!

# SUPPORT

Bugs may be submitted through [the RT bug tracker](https://rt.cpan.org/Public/Dist/Display.html?Name=Inlined-Package)
(or [mailto:bug-Inlined-Package@rt.cpan.org](mailto:bug-Inlined-Package@rt.cpan.org)).
I am also usually active on irc, as 'ether' at `irc.perl.org`.

# ACKNOWLEDGEMENTS

This module was inspired by a conversation witnessed on `modules@perl.org` --
credit for the idea goes to Linda Walsh.

# AUTHOR

Karen Etheridge <ether@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Karen Etheridge.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
