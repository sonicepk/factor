notes.txt

:Author: ekenny
:Email: ekenny@aine
:Date: 2019-02-17 19:10

Factorising is very difficult to do, while it might look trivial for smallish numbers it gets very difficult quickly.
It is for this reason that large prime number are used as the basis for a lot of security protocols such as RSA.

Factorsing is the process of breaking a number down into it's primes. Every whole number can be written as a combination 
of prime numbers.

A prime number is a number that is only divisible by itself and 1. 2 is the first and only even prime number. 

The simplest way to factorise a number is to get the square root of the number and then starting at 2 work your way up the square root until you find a factor.
This method is highly inefficient and I have written an example called factor.pl that does this.

There are much more efficient ways to check for primes. These tests are called Primality Tests.  

Firstly we have Fermat's Little Theorem this can be used to indicate if a number is composite or possibly prime. 
If a number fails FLT well then it is composite. If it passes it is probably a prime but we have no guarantee.

An improved check for primality is Miller-Rabin primality test. Once again this is a test which can confirm (prove)
that a number is not a prime or it will assert that a number is possibly a prime with a particular error of probability.

So the first thing to do when trying to factorise a number is to first use Miller-Rabin to determine that the number 
we are evaluating is or is not a prime to start with. If it is not a prime, then move onto trying to factorise it.

If you are looking to do this properly try using Math::Prime::Util

RSA 512 was broken in 1999. In 2015 RSA 512 was broken in 4 hours on EC2. RSA 1024 has still not been broken but it is only a matter of time. 
https://arstechnica.com/information-technology/2015/10/breaking-512-bit-rsa-with-amazon-ec2-is-a-cinch-so-why-all-the-weak-keys/
Factoring as a Service on EC2
https://eprint.iacr.org/2015/1000.pdf

.e vim: expandtab filetype=rst shiftwidth=4 tabstop=4

