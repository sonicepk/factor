use strict;
use warnings;
use Math::BigInt;

#Let n be a positive integer. Show that every integer m with 1≤m≤2n can be expressed 
#as 2^p x k, where p is a nonnegative integer and k is an odd integer with 1≤k<2n.

#https://www.perlmonks.org/?node_id=46889
#
my $orig_number = shift;
print "Input is $orig_number\n";
(my $exp, my $foo)  = round_up($orig_number);
print "exp = $exp, foo = $foo\n";

sub round_up {
 my $i = (shift);
 #my $exp = (int(log($_)/log(2)));#work out exponent to base 2. 
 #my $num = (2**$exp);
 my $bits_shifted = 0; 
my $result;

 while (!$result){
 $result = $i & 1;#check if last bit is 1, if it is the number is odd stop, we have found k. 
  if ($result){
  last;
  }
  #otherwise shift the bits to the right, ie divide by 2. 
  $i = $i >> 1;
  $bits_shifted++;
  print "result shift = $i\n";
} # print "exp = $exp, num = $num, local = $_\n";
 # $_ = $_ + 1;
 # my $odd = $_ - $num;
 #return ($_ & $odd); # bit wise or, then return +1.
  return($bits_shifted, $i);
}
