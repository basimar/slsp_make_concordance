#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

# Generiert Deduplizierungs-Statistik basierend auf SLSP-Konkordanz (SLSP_SP1_System-number-concordance_20201127.txt)
# Input: SLSP-Konkordanz (SLSP_SP1_System-number-concordance_20201127.txt)
# Output: https://here.slsp.ch/display/PSI/Migration%3A+Bibliographic+records

     
my $alma = $ARGV[0] or die "Need to get CSV file on the command line\n";

my %idsbb;
my %idslu;
my %idssg;
my %nebis;
my %rero;
my %sbt;

my %sys;
     
open(my $data_alma, '<', $alma) or die "Could not open '$alma' $!\n";
while(<$data_alma>) {
    chomp;
    my($orig, $swissbib) = split /\|/ or next;

    $sys{$swissbib} = 1;

    if ($orig =~ /IDSBB/ ) {
        $idsbb{$swissbib} ++;
    } elsif ($orig =~ /IDSLU/ ) {
        $idslu{$swissbib} ++;
    } elsif ($orig =~ /IDSSG/ ) {
        $idssg{$swissbib} ++;
    } elsif ($orig =~ /NEBIS/ ) {
        $nebis{$swissbib} ++; 
    } elsif ($orig =~ /RERO/ ) {
        $rero{$swissbib} ++;
    } elsif ($orig =~ /SBT/ ) {
        $sbt{$swissbib} ++;
    }
}
close $data_alma;


for (keys %sys) {
    if ($idsbb{$_}) {
        print $idsbb{$_} . "-"
    } else {
        print "0-"
    }
    
    if ($idslu{$_}) {
        print $idslu{$_} . "-"
    } else {
        print "0-"
    }
     
    if ($idssg{$_}) {
        print $idssg{$_} . "-"
    } else {
        print "0-"
    }

    if ($nebis{$_}) {
        print $nebis{$_} . "-"
    } else {
        print "0-"
    }
    
    if ($rero{$_}) {
        print $rero{$_} . "-"
    } else {
        print "0-"
    }

    if ($sbt{$_}) {
        print $sbt{$_} . "\n"
    } else {
        print "0\n"
    }

}
#print Dumper(%sbt);


exit;
