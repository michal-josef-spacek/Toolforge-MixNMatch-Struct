package Toolforge::MixNMatch::Struct::Catalog;

use strict;
use warnings;

use Toolforge::MixNMatch::Struct::User;
use Toolforge::MixNMatch::Struct::YearMonth;
use Toolforge::MixNMatch::Object::Catalog;

our $VERSION = 0.02;

sub obj2struct {
	my $obj = shift;

	my $struct_hr = {
		'type' => [{
			'type' => $obj->type,
			'cnt' => $obj->count,
		}],
		'user' => [],
		'ym' => [],
	};
	foreach my $year_month (@{$obj->year_months}) {
		push @{$struct_hr->{'ym'}},
			Toolforge::MixNMatch::Struct::YearMonth::obj2struct($year_month);
	}
	foreach my $user (@{$obj->users}) {
		push @{$struct_hr->{'user'}},
			Toolforge::MixNMatch::Struct::User::obj2struct($user);
	}

	return $struct_hr;
}

sub struct2obj {
	my $struct_hr = shift;

	my $year_months = [];
	foreach my $year_month_hr (@{$struct_hr->{'ym'}}) {
		push @{$year_months}, Toolforge::MixNMatch::Struct::YearMonth::struct2obj($year_month_hr);
	}
	my $users = [];
	foreach my $user_hr (@{$struct_hr->{'user'}}) {
		push @{$users}, Toolforge::MixNMatch::Struct::User::struct2obj($user_hr);
	}
	my $obj = Toolforge::MixNMatch::Object::Catalog->new(
		'count' => $struct_hr->{'type'}->[0]->{'cnt'},
		'type' => $struct_hr->{'type'}->[0]->{'type'},
		'users' => $users,
		'year_months' => $year_months,
	);

	return $obj;
}

1;

__END__
