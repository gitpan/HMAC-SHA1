use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

print "Checking for SHA... ";
eval {
    require SHA;
};
if ($@) {
    print " failed\n";
    print <<EOT;
HMAC::SHA1 requires SHA to compute the HMAC digest.  Please install
the SHA module.  See http://www.perl.com/CPAN/ for details.

EOT
    exit;
}

print "\n\n";

WriteMakefile(
    'NAME'      => 'HMAC::SHA1',
    'VERSION_FROM' => 'lib/HMAC/SHA1.pm', # finds $VERSION
);


