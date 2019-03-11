use strict;
use warnings;
use Math::BigInt;

#Let n be a positive integer. Show that every integer m with 1≤m≤2n can be expressed 
#as 2^p x k, where p is a nonnegative integer and k is an odd integer with 1≤k<2n.

#https://www.perlmonks.org/?node_id=46889
#
my $orig_number = shift;
print "Input is $orig_number\n";
(my $exp, my $foo)  = npk ($orig_number);

print "2^exp = 2^$exp x $foo\n";

sub npk {
  my $i = (shift);
  my $bits_shifted = 0; 

 while (!($i & 1)){ #check if last bit is 1, if it is the number is odd stop, we have found k. 
  #otherwise shift the bits to the right, ie divide by 2. 
  $i = $i >> 1;
  $bits_shifted++;
  } 
  return($bits_shifted, $i);
}
