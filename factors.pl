use strict;
use warnings;
use bigint;

# perl -MCPAN -e 'install Math::Prime::Util'
# perl -MMath::Prime::Util=:all -E 'say for @{ primes ( 0, 1000)} '
#
#Calculate the prime factors of a number. This is very inefficient as it
#searches for all numbers 2, 3, 4, 5 etc up to N. It should just be checking
#for primes up to N. 
#It also will iterate through all numbers up to the sqrt of N even if it has found 
#all the primes already. 
#This is called Direct Search Factorization - trial by division. 
#
my $orig_number = shift;
print "Input is $orig_number\n";

my $number;
$number = $orig_number;

my @factors;
my $end = sqrt ($number); #The largest possible factor will be half the actual number;

foreach my $factor (2 .. $end) {
  #should check if $number is prime. If it is add it to the array and end.
  my $mod =  $number % $factor; #returns the modular result 9%2 = 1
  my $remainder = 0; #keep dividing by a number until it no longer evenly divides into the number.

  while (!$remainder) {
   if ($mod == 0) { #We have a factor
      push @factors, $factor;
      $number = $number / $factor; #reduce the number by the factor we have found. 
      $mod =  $number % $factor; #check if our factor is still a factor of the new number.
      print "Number = $number, $factor \n";
   } else {
          $remainder = 1; #the factor is no longer a factor of the reduced $number.
          }
   }#end of while
    if ($number == 1){last;}#we have finished and found all the primes so stop iterating. 

 }
 #check to see if last $number is 1, if not it is prime and should be added to @factors
 if ($number > 1){
            push @factors, $number;
 }
 if (scalar @factors == 0){
  print "$number has no factors hence it must be prime to start with\n";
   } else {
  print "prime factors are @factors\n";
   }
