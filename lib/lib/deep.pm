package lib::deep;
use 5.010001;
use lib::abs ();
our $VERSION = qw(0.90);

sub import{
    my $class = shift;
    my $pkg = caller;
    my $package_depth = 0;
    ++$package_depth while $pkg=~s/\A\w+:://;
    my $upper;
    if ( $package_depth == 0 ){
	$upper = '.';
    }
    else {
	$upper = join "/", ( "..") x $package_depth;
    }
    @_ = ('lib::abs', $upper);
    goto &lib::abs::import;

}

1;
__END__

=head1 lib:deep

lib::deep - simple enchantment over lib::abs 

=head1 SYNOPSIS

    
    package A::B::C;
    # use lib::abs qw(../..)
    use lib::deep; 
    
    .... 

    Or 
    package A::B;
    # use lib::abs qw(..);
    use lib::deep;

=head1 DESCRIPTION

I used to write modules with 'use lib::abs qw(.)' or use lib::abs qw(../..)'
But some day this activity became annoy me, because figuring how many dots and slashes needed for lib::abs.
Now my computer do it for me.

When I write code:
package A::B;
use lib::deep;

this translated into 

package A::B;
use lib::abs qw(..);


=head1 SEE ALSO

    lib::abs

=head1 AUTHOR

GTOLY, E<lt>grian@E<gt>cpan.org

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by grian

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
