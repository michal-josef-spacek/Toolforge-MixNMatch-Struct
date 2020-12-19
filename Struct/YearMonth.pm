package Toolforge::MixNMatch::Struct::YearMonth;

use strict;
use warnings;

use Toolforge::MixNMatch::Object::YearMonth;

our $VERSION = 0.02;

sub obj2struct {
	my $obj = shift;

	my $struct_hr = {
		'cnt' => $obj->count,
		'ym' => $obj->year.$obj->month,
	};

	return $struct_hr;
}

sub struct2obj {
	my $struct_hr = shift;

	my ($year, $month) = $struct_hr->{'ym'} =~ m/^(\d{4})(\d{2})$/ms;
	my $obj = Toolforge::MixNMatch::Object::YearMonth->new(
		'count' => $struct_hr->{'cnt'},
		'month' => $month,
		'year' => $year,
	);

	return $obj;
}

1;

__END__
