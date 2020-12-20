package Toolforge::MixNMatch::Struct::User;

use strict;
use warnings;

use Toolforge::MixNMatch::Object::User;

our $VERSION = 0.04;

sub obj2struct {
	my $obj = shift;

	my $struct_hr = {
		'cnt' => $obj->count,
		'uid' => $obj->uid,
		'username' => $obj->username,
	};

	return $struct_hr;
}

sub struct2obj {
	my $struct_hr = shift;

	my $obj = Toolforge::MixNMatch::Object::User->new(
		'count' => $struct_hr->{'cnt'},
		'uid' => $struct_hr->{'uid'},
		'username' => $struct_hr->{'username'},
	);

	return $obj;
}

1;

__END__
