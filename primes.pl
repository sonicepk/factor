use strict;
use warnings;
use bigint;
use Math::Prime::Util qw(primes);
use feature qw(say switch);

#say for @{ primes ( 0, 1000)}; 
say for @{ primes ( 0, shift)}; 
