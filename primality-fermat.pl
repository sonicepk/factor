use strict;
use warnings;
use Math::BigInt;


#Fermat's Little Theorm says that is a^p-1 1 mod p. If p is a prime then this
#always is true while if it is false it is a good indication that the number is
#composite but not with 100% guaranteed.
#
my $orig_number = shift;
print "Input is $orig_number\n";

sub random_int_between {
            my($min, $max) = @_;
            # Assumes that the two arguments are integers themselves!
            return $min if $min == $max;
            ($min, $max) = ($max, $min)  if  $min > $max;
            return $min + int rand(1 + $max - $min);
        }

my $number;
$number = $orig_number;

my $error_prob = 40;
my $composite = 0;

foreach my $i (0 .. $error_prob)
{ 
  my $a = random_int_between(2, $number - 1 ); 
  #when I use the perl % mod operator I get a lot of false composites. BigInt
  #appears to reduce these. 
  my $x = Math::BigInt->new($a);
  my $b = $x->bmodpow($number -1 ,$number);
  #my $b = $a**( $number - 1 ) % $number;
  if ($b != 1)
  {
    $composite = 1;
    print "i = $i, a = $a, b = $b,  $number is composite\n";
    last;
  }
}
if (!$composite){
print "$number is Probably Prime\n";
}
