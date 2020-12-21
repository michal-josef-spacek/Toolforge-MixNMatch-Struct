#!/usr/bin/env perl

use strict;
use warnings;

use Data::Printer;
use Toolforge::MixNMatch::Object::YearMonth;
use Toolforge::MixNMatch::Struct::YearMonth qw(obj2struct);

# Object.
my $obj = Toolforge::MixNMatch::Object::YearMonth->new(
        'count' => 6,
        'month' => 9,
        'year' => 2020,
);

# Get structure.
my $struct_hr = obj2struct($obj);

# Dump to output.
p $struct_hr;

# Output:
# \ {
#     cnt   6,
#     ym    202009
# }