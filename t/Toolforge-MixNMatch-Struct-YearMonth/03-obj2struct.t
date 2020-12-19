use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Toolforge::MixNMatch::Object::YearMonth;
use Toolforge::MixNMatch::Struct::YearMonth;

# Test.
my $obj = Toolforge::MixNMatch::Object::YearMonth->new(
	'count' => 10,
	'month' => 1,
	'year' => 2020,
);
my $struct_hr = Toolforge::MixNMatch::Struct::YearMonth::obj2struct($obj);
is_deeply(
	$struct_hr,
	{
		'cnt' => 10,
		'ym' => 202001,
	},
	'Simple conversion.',
);
