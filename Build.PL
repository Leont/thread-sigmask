use 5.006;
use strict;
use warnings;
use Module::Build;

if ($^O eq 'MSWin32') {
	print "No support for OS\n";
	exit;
}

my $builder = Module::Build->new(
	module_name         => 'Thread::SigMask',
	license             => 'perl',
	dist_author         => q{Leon Timmermans <leont@cpan.org>},
	dist_version_from   => 'lib/Thread/SigMask.pm',
	configure_requires  => {
		'Module::Build' => 0.28,
	},
	build_requires      => {
		'ExtUtils::CBuilder' => 0,
		'Module::Build' => 0.28,
		'Test::More'    => 0,
	},
	requires            => {
		perl            => 5.006,
		'Sub::Exporter' => 0,
	},
	add_to_cleanup      => [ 'Thread-SigMask-*' ],
	create_makefile_pl  => 'small',
	sign                => 0,
);

$builder->create_build_script();
