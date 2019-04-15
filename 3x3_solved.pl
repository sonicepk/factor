use strict;
use warnings;
use bigint;
use Math::Prime::Util qw(primes is_prime);
use feature qw(say switch);
use Data::Dumper;
#my @myprimes = @{ primes( 0, 59 ) };
my @myprimes = @{ primes( 4567891, 4569999 ) };

#The problem, Find nine different prime numbers that can be placed in a 3x3
#square in such a way that the average of every row, column and diagonal is
#also a prime. ibm research ponder this April 2019 challenge.
#
my @triple;

for my $i ( 0 .. $#myprimes ) {
    my $i_plus1 = $i + 1;
    for my $j ( $i_plus1 .. $#myprimes ) {
        my $j_plus1 = $j + 1;
        for my $k ( $j_plus1 .. $#myprimes ) {
            my $total  = $myprimes[$i] + $myprimes[$j] + $myprimes[$k];
            my $my_avg = $total / 3;
            if ( !( $total % 3 ) && is_prime($my_avg) ) {
                push @triple, [ $myprimes[$i], $myprimes[$j], $myprimes[$k] ];
            }
        }
    }
}

for my $row ( 0 .. $#triple - 2 ) {
    my $a1 = $triple[$row]->[0];
    my $a2 = $triple[$row]->[1];
    my $a3 = $triple[$row]->[2];

    my $row_2 = $row + 1;
    for my $row_b ( $row_2 .. $#triple ) {
        my $b1 = $triple[$row_b]->[0];
        my $b2 = $triple[$row_b]->[1];
        my $b3 = $triple[$row_b]->[2];

        my $row_3 = $row_2 + 1;
        for my $row_c ( $row_3 .. $#triple ) {
            my $c1 = $triple[$row_c]->[0];
            my $c2 = $triple[$row_c]->[1];
            my $c3 = $triple[$row_c]->[2];

            if (   ( $a1 == $b1 )
                || ( $a1 == $b2 )
                || ( $a1 == $b3 )
                || ( $a2 == $b1 )
                || ( $a2 == $b2 )
                || ( $a2 == $b3 )
                || ( $a3 == $b1 )
                || ( $a3 == $b2 )
                || ( $a3 == $b3 )
                || ( $a1 == $c1 )
                || ( $a1 == $c2 )
                || ( $a1 == $c3 )
                || ( $a2 == $c1 )
                || ( $a2 == $c2 )
                || ( $a2 == $c3 )
                || ( $a3 == $c1 )
                || ( $a3 == $c2 )
                || ( $a3 == $c3 )
                || ( $b1 == $c1 )
                || ( $b1 == $c2 )
                || ( $b1 == $c3 )
                || ( $b2 == $c1 )
                || ( $b2 == $c2 )
                || ( $b2 == $c3 )
                || ( $b3 == $c1 )
                || ( $b3 == $c2 )
                || ( $b3 == $c3 ) )
            {
                next;
            }
            else {
                my $col1  = ( $a1 + $b1 + $c1 ) / 3;
                my $col2  = ( $a2 + $b2 + $c2 ) / 3;
                my $col3  = ( $a3 + $b3 + $c3 ) / 3;
                my $diag1 = ( $a1 + $b2 + $c3 ) / 3;
                my $diag2 = ( $a3 + $b2 + $c1 ) / 3;

                if (   is_prime($col1) && !(($a1 + $b1 + $c1) % 3 )
                    && is_prime($col2) && !(($a2 + $b2 + $c2) % 3 )
                    && is_prime($col3) && !(($a3 + $b3 + $c3) % 3 )
                    && is_prime($diag1) && !(($a1 + $b2 + $c3) % 3 )
                    && is_prime($diag2) && !(($a3 + $b2 + $c1) % 3 ))
                {
                    say "3x3 Array:";
                    say "$a1, $a2, $a3 = " . ($a1+$a2+$a3)/3;
                    say "$b1, $b2, $b3 = " . ($b1+$b2+$b3)/3;
                    say "$c1, $c2, $c3 = " . ($c1+$c2+$c3)/3;
                    say "--  --  --";
                    say "$col1, $col2, $col3";
                }

            }
        }
    }
}

#say Dumper (@triple);
