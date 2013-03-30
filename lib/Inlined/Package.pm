use strict;
use warnings;
package Inlined::Package;
# ABSTRACT: ...

use Module::Runtime qw(module_notional_filename use_module);
use Import::Into;

sub import
{
    my ($self, $subject) = @_;
    my ($caller, $caller_file) = caller;
    my $filename = module_notional_filename($subject);
    $::INC{$filename} = $caller_file;
    use_module($subject);
    $subject->import::into($caller);
}

1;
__END__

=pod

=head1 SYNOPSIS

...

=head1 DESCRIPTION


=head1 FUNCTIONS/METHODS

=begin :list

* C<foo>

=end :list

...

=head1 SUPPORT

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Inlined-Package>
(or L<mailto:bug-Inlined-Package@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=head1 ACKNOWLEDGEMENTS

...

=head1 SEE ALSO

...

=cut
