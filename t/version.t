# $Id$
use strict;
use warnings;
use Test::More;

plan skip_all => 'This test is only run for the module author'
    unless -d '.git' || $ENV{IS_MAINTAINER};

BEGIN { eval "use Test::Version; 1;" or die $@; }

my @imports = ( 'version_all_ok' );

my $params = {
    is_strict   => 0,
    has_version => 0,
};

push @imports, $params
    if version->parse( $Test::Version::VERSION ) >= version->parse('1.002');


Test::Version->import(@imports);

version_all_ok;
done_testing;
