use Module::Build;

use strict;
use warnings;

use Test::Builder;

# 0.99 broke test_out with qr//
my $tb_v = Test::Builder->VERSION eq '0.99' ? '1.001002' : '0.78';

my $build = Module::Build->new(
    module_name => 'Test::Class',
    license     => 'perl',
    requires    => {
        'perl'                  => '5.008001',
        'Attribute::Handlers'   => '0.77',
        'MRO::Compat'           => '0.11',
        'Storable'              => '2.04',
        'Test::Simple'          => '0.78',
        'Test::Builder'         => $tb_v,
        'Test::Builder::Tester' => '1.02',
        'Test::More'            => '0.78',
    },
    build_requires => {
        'Test::Exception'       => '0.25',
        'IO::File'              => '1.09',
    },
    meta_merge => {
        resources => {
            repository => 'http://github.com/adrianh/test-class/',
        },
    },
    create_makefile_pl => 'traditional',
    create_readme      => 1,
);
$build->create_build_script;
