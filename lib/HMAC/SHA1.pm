package HMAC::SHA1;

# Copyright (c) 1998 Clinton Wong. All rights reserved.
# This program is free software; you can redistribute it
# and/or modify it under the same terms as Perl itself. 

use strict;
use vars qw($VERSION @ISA @EXPORT);
require Exporter;
require AutoLoader;
@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
use SHA;

$VERSION = '0.01';

sub hash {
  my ($the_string, $key) = @_;

  if ( length($key) > 64) { $key = new SHA->hash($key) }

  my $ipad =xor_string_max_64($key, 0x36);
  my $opad =xor_string_max_64($key, 0x5c);

  new SHA->hash($opad . (new SHA->hash($ipad . $the_string)));
}

sub hexhash {
  unpack("H*", hash(@_));
}

sub xor_string_max_64 {
  my ($string, $xor_with) = @_;
  my @ASCII = unpack("C*", $string);
  my $i;

  for ($i=0; $i<=$#ASCII; $i++) { $ASCII[$i] =  $ASCII[$i] ^ $xor_with }
  if ($#ASCII < 63) {
    for ($i=$#ASCII+1; $i<=63; $i++) { $ASCII[$i] = $xor_with }
  }
  pack("C*", @ASCII);
}

1;
__END__

=head1 NAME

HMAC::SHA1 - Perl module to compute an HMAC SHA-1 digest.

=head1 SYNOPSIS

 use HMAC::SHA1;
 hex($string, $key) returns a 20 byte digest in binary form.
 hexhash($string, $key) returns a 20 byte digest as printable hex.

=head1 DESCRIPTION

 This module computes an HMAC SHA-1 digest as specified by RFC 2104.

=head1 EXAMPLE

 use HMAC::SHA1;
 print HMAC::SHA1::hexhash("what do ya want for nothing?", "Jefe"),
       " should be effcdf6ae5eb2fa2d27416d5f184df9c259a7c79\n";

=head1 SEE ALSO

 RFC 2104        - HMAC specification.
 RFC 2202        - HMAC test cases.
 FIPS PUB 180-1  - SHA-1 specification.

=head1 AUTHOR

 Clinton Wong, clintdw@netcom.com

=head1 COPYRIGHT
 
 The HMAC::SHA1 module is Copyright (c) 1998 Clinton Wong.
 All rights reserved.  This program is free software; you
 can redistribute it and/or modify it under the same terms
 as Perl itself.
=cut

