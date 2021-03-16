#!/usr/bin/perl
use strict;
use warnings;

# Erstellt Konkordanz swissbib-Systemnummer, 
#Argument 1: csv-Datei mit Alma NZ-MMSID und swissbib ID (41SLSP_NETWORK_BIB_IDs.csv Datei von Ex Libris)
#Argument 2: csv-Datei mit swissbib ID und alte Aleph/Virtua-Systemnummer (inkl. Präfix und Suffix). Generiert aus Aleph Sequential Datei mit allen 035-Feldern 
#Output: Alte-Systemnummer | swissbib-Systemnummer | Alma NZ-MMSID
     
     
my $alma = $ARGV[0] or die "Need to get CSV file on the command line\n";
my $swissbib = $ARGV[1] or die "Need to get CSV file on the command line\n";

my %alma;
my %swissbib;
     
open(my $data_alma, '<', $alma) or die "Could not open '$alma' $!\n";
while(<$data_alma>) {
    chomp;
    my($value, $key) = split /,/ or next;
    $alma{$key} = $value;
}
close $data_alma;

open(my $data_swissbib, '<', $swissbib) or die "Could not open '$swissbib' $!\n";
while(<$data_swissbib>) {
    chomp;
    my($value, $key) = split /,/ or next;
    $swissbib{$key} = $value;
}
close $data_swissbib;

for (keys %swissbib) {
    print $_ . "|" . $swissbib{$_} . "|" . $alma{$swissbib{$_}} .  "\n"
}

exit;
