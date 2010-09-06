package Thread::SigMask;

use strict;
use warnings FATAL => 'all';

use XSLoader;
use Sub::Exporter -setup => { exports => [qw/sigmask/], groups => { default => [qw/sigmask/] } };

our $VERSION = '0.001';
XSLoader::load(__PACKAGE__, $VERSION);

1;    # End of Thread::SigMask

__END__

=head1 NAME

Thread::SigMask - Thread specific signal masks

=head1 VERSION

Version 0.001

=head1 SYNOPSIS

    use Thread::SigMask qw/sigset/;
	use POSIX qw/SIG_BLOCK SIG_UNBLOCK/;
	
    sigmask(SIG_BLOCK, $sigset);
	...
    sigmask(SIG_UNBLOCK, $sigset);

=head1 DESCRIPTION

This module provides per-thread signal masks. On non-threaded perl's, it will be effectively the same as POSIX::sigprocmask. The interface works exactly the same as sigprocmask.

=head1 SUBROUTINES

=head2 sigmask($how, $newset, $oldset = undef)

Change and/or examine calling process's signal mask. This uses C<POSIX::SigSet> objects for the newset and oldset arguments. The behavior of the call is dependent on the value of how.

=over 4

=item * SIG_BLOCK

The set of blocked signals is the union of the current set and the set argument.

=item * SIG_UNBLOCK

The signals in set are removed from the current set of blocked signals. It is permissible to attempt to unblock a signal which is not blocked.

=item * SIG_SETMASK

The set of blocked signals is set to the argument set.

=back

If oldset is defined, the previous value of the signal mask is stored in oldset. If newset is NULL, then the signal mask is unchanged (i.e., how is ignored), but the current value of the signal mask is nevertheless returned in oldset (if it is not NULL).

=head1 SEE ALSO

L<Signal::Mask>

=head1 AUTHOR

Leon Timmermans, C<< <leont at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-thread-sigmask at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Thread-SigMask>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Thread::SigMask

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Thread-SigMask>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Thread-SigMask>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Thread-SigMask>

=item * Search CPAN

L<http://search.cpan.org/dist/Thread-SigMask/>

=back

=head1 ACKNOWLEDGEMENTS

Parts of this documentation is shamelessly stolen from L<POSIX> and Linux' L<sigprocmask(2)>.

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Leon Timmermans.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
