use strict;
use warnings;

my $orig_number = shift;
print "Input is $orig_number\n";

my $number;
$number = $orig_number;

my $error_prob = 4;

my @factors;
my $end = sqrt ($number); #The largest possible factor will be half the actual number;
#Fermat's method starts seeking x, y with q = |sqrt (n)| +1 and y = 1.
#

my $x = int (sqrt ($number));  
my $y = 1;
my $result;

$result = ($x**2 - $y**2 - $number);

while ($result != 0){
  if ($result > 0){
  $y = $y + 1;
  }
  else{
  $x = $x + 1;
 }
$result = ($x**2 - $y**2 - $number);
print "x = $x, y = $y, result = $result\n";
}
print "x = $x, y = $y, number = $number, result = $result\n";

print "two factors are ", $x+$y ." and ", $x-$y ."\n";

