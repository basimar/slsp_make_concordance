#!/usr/bin/perl
use strict;
use warnings;
     
#Generiert Konkordanz swissbib Basel Bern / Aleph-Systemnummer     
#Argument 1: Datei mit swissbib-Systemnummern, die in swissbib Basel Bern vorkommen
#Argument 2: Aleph Sequential Datei aus swissbib mit Feld 035 

my $sbbb = $ARGV[0] or die "Need to get CSV file on the command line\n";
my $f035 = $ARGV[1] or die "Need to get CSV file on the command line\n";

my %f035;

open my $data_sbbb, '<', $sbbb or die "$0: open $sbbb: $!";
chomp(my @sbbb = <$data_sbbb>);
close $data_sbbb;
     
open(my $data_f035, '<', $f035) or die "Could not open '$f035' $!\n";
while(<$data_f035>) {
    chomp;
    my $key = substr($_,1,9);
    my $value = $_;
    $f035{$key} = $value;
}
close $data_f035;

for (@sbbb) {
    print $f035{$_} . "\n";
}

exit;
