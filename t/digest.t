# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..8\n"; }
END {print "not ok 1\n" unless $loaded;}
use HMAC::SHA1;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

if (HMAC::SHA1::hexhash("Hi There" , chr(11) x 20) eq
    'b617318655057264e28bc0b6fb378c8ef146be00') {
  print "ok 2\n";
} else {
  print "not ok 2\n";
}

if (HMAC::SHA1::hexhash("what do ya want for nothing?", "Jefe") eq
    'effcdf6ae5eb2fa2d27416d5f184df9c259a7c79') {
  print "ok 3\n";
} else {
  print "not ok 3\n";
}

if (HMAC::SHA1::hexhash(chr(221) x 50, chr(170) x 20) eq
    '125d7342b9ac11cd91a39af48aa17b4f63f175d3') {
  print "ok 4\n";
} else {
  print "not ok 4\n";
}

if (HMAC::SHA1::hexhash(chr(205) x 50, pack("H*",
             "0102030405060708090a0b0c0d0e0f10111213141516171819"))
    eq '4c9007f4026250c6bc8414f9bf50c86c2d7235da') {
  print "ok 5\n";
} else {
  print "not ok 5\n";
}

if (HMAC::SHA1::hexhash("Test With Truncation", chr(12) x 20 ) eq
    '4c1a03424b55e07fe7f27be1d58bb9324a9a5a04') {
  print "ok 6\n";
} else {
  print "not ok 6\n";
}

if (HMAC::SHA1::hexhash("Test Using Larger Than Block-Size Key - Hash Key First",
     chr(170) x 80 ) eq
    'aa4ae5e15272d00e95705637ce8a3b55ed402112') {
  print "ok 7\n";
} else {
  print "not ok 7\n";
}

if (HMAC::SHA1::hexhash(
   "Test Using Larger Than Block-Size Key and Larger Than One Block-Size Data",
     chr(170) x 80 ) eq
    'e8e99d0f45237d786d6bbaa7965c7808bbff1a91') {
  print "ok 8\n";
} else {
  print "not ok 8\n";
}

