use strict;
use warnings;
package Inlined::Package;
# ABSTRACT: EXPERIMENTAL - define multiple packages in one file, and reference them in any order

use Module::Runtime qw(module_notional_filename use_module);
use Import::Into;

sub import
{
    my ($self, $subject, @args) = @_;
    my ($caller, $caller_file) = caller;
    my $filename = module_notional_filename($subject);
    $::INC{$filename} = $caller_file;
    use_module($subject)->import::into($caller, @args);
}

1;
__END__

=pod

=head1 SYNOPSIS

If you've ever defined multiple packages in the same file, but want to C<use>
one package in another, you'll have discovered why it's much
easier to simply follow best practices and define one package per file.

However, this module will let you minimize your inode usage:

    package Foo;
    sub bar { print "this is the foo sub!\n"; }

    package Bar;
    use Inlined::Package 'Foo';     # no kaboom!

    1;

Simply change C<< use Foo >> to C<< use Inlined::Package 'Foo' >> and you can
(probably) safely define and use packages in any order.

This module is for demonstration purposes only, and in no way am I
recommending you use this in any production code whatsoever.

=head1 FUNCTIONS/METHODS

There is no public API other than the C<use> directive itself, which is passed
the name of the module that you want to C<use> immediately.

=head1 CAVEATS

There may be edge cases where this doesn't work right, or leads to infinite
looping when trying to compile modules. Use at your own risk!

=head1 SUPPORT

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Inlined-Package>
(or L<mailto:bug-Inlined-Package@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=head1 ACKNOWLEDGEMENTS

This module was inspired by a conversation witnessed on C<modules@perl.org> --
credit for the idea goes to Linda Walsh.

=cut
