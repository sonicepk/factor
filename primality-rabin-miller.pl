use strict;
use warnings;
use Math::BigInt;


#Fermat's Little Theorm says that is a^p-1 1 mod p. If p is a prime then this
#always is true while if it is false it is a good indication that the number is
#composite but not with 100% guaranteed.
#An issue with FLT is that it is false far too often, an improvement on FLT is
#the Miller-Rabin Test. 
#
#First the input must be odd, we then rewrite the input as an even number +1.
#To calculate the even number we rewrite it as 2^s * m
#
#
my $orig_number = shift;
print "Input is $orig_number\n";

#routine to rewrite input into 2^r*d.
sub nsm {
  my $i = (shift);
  my $bits_shifted = 0; 

 while (!($i & 1)){ 
   #bitwise and for the last bit. 
   #check if last bit is 1, if it is the number is odd stop, we have found k. 
   #otherwise the number is even so shift the bits to the right, ie divide by 2. 
  $i = $i >> 1;
  $bits_shifted++;
  } 
  return($bits_shifted, $i);
}

sub random_int_between {
            my($min, $max) = @_;
            # Assumes that the two arguments are integers themselves!
            return $min if $min == $max;
            ($min, $max) = ($max, $min)  if  $min > $max;
            return $min + int rand(1 + $max - $min);
        }

my $number;
(my $s, my $m ) = nsm ($orig_number - 1);

my $error_prob = 5;
my $composite = 0;

foreach my $i (0 .. $error_prob)
{ 
  my $a = random_int_between(2, $orig_number - 1); 
  #when I use the perl % mod operator I get a lot of false composites. BigInt
  #appears to reduce these. 
  my $x = Math::BigInt->new($a);
  my $b = $x->bmodpow($m,$orig_number);
  #      print "i = $i, s = $s, m = $m,  a = $a, b = $b,  $orig_number is composite\n";
  if ($b != 1)
  {
    $composite = 1;
    for (my $j = 1; $j < $s;  $j++){
      if ($b eq ($orig_number - 1))
      {
      print "$orig_number b is equal to original -1 Probably Prime\n";
      print "i = $j, s = $s, m = $m,  a = $a, b = $b, $orig_number is prob prime\n";
      exit;
      }
    my $y = Math::BigInt->new($b);
    $b = $y->bmodpow(2,$orig_number);
    print "i = $j, s = $s, m = $m,  a = $a, b = $b, $orig_number is composite\n";
    }
  }
}
  if ($composite)
  {
    print "After for loop  s = $s, m = $m, $orig_number is composite\n";
  }  
  else {
  print "Prime s = $s, m = $m, $orig_number \n";
  print "$orig_number is Probably a Prime\n";
  }
