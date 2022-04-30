#!/usr/bin/perl
# vim: set filetype=perl:
use strict;
use warnings;
use Getopt::Long;

my $newfile = $ARGV[0] ? $ARGV[0] : 'default-name.pl';

open my $fh, '>>', $newfile or die "Can't open $newfile: $_";
system("chmod 755 $newfile");
print $fh "#!/usr/bin/perl
use strict;
use warnings;


";

close $fh or die "Cant close file $newfile: $_";
