package main;

use 5.026001;
use ExtUtils::MakeMaker;
use Config ();

my %Config = %Config::Config;

WriteMakefile(
    NAME              => 'Graphite::Simple',
    VERSION_FROM      => 'lib/Graphite/Simple.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    MIN_PERL_VERSION  => 5.026001,
    PREREQ_PM         => {
        'XSLoader'        => 0.27,
        'Test::Kwalitee'  => 1.27,
        'Test::More'      => 1.302183,
        'Test::Deep'      => 1.130,
        'Test::LeakTrace' => 0.14,
        'Config'          => 0,
        'File::Temp'      => 0.2304,
    },
    META_MERGE => {
        'resources' => {
            'bugtracker' => 'https://github.com/KalessinD/perl_graphite_simple/issues',
            'repository' => 'https://github.com/KalessinD/perl_graphite_simple',
        },
    },
    ABSTRACT_FROM     => 'lib/Graphite/Simple.pm', # retrieve abstract from module
    AUTHOR            => 'Chernenko Dmitriy <cnd@cpan.org>',
    CC => 'c++',
    LD => 'c++',
    LICENSE           => 'perl',
    CCFLAGS   => "-O3 -std=c++17 -msse2 -msse4.2 ${Config{ccflags}}",
    LDDLFLAGS => "-O3 -std=c++17 -msse2 -msse4.2 ${Config{lddlflags}}",
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '', # e.g., '-I/usr/include/other'
    test => {TESTS => 't/*.t xt/release/*.t'},
);

1;
__END__
