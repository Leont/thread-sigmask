#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Thread::SigMask' ) || print "Bail out!
";
}

diag( "Testing Thread::SigMask $Thread::SigMask::VERSION, Perl $], $^X" );
