use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Toolforge::MixNMatch::Object::User;
use Toolforge::MixNMatch::Struct::User;

# Test.
my $obj = Toolforge::MixNMatch::Object::User->new(
	'count' => 10,
	'uid' => 1,
	'username' => 'skim',
);
my $struct_hr = Toolforge::MixNMatch::Struct::User::obj2struct($obj);
is_deeply(
	$struct_hr,
	{
		'cnt' => 10,
		'uid' => 1,
		'username' => 'skim',
	},
	'Simple conversion.',
);
