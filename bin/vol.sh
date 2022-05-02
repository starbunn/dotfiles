#!/usr/bin/perl

## the sink we are interested in (the default)
my $sink = `pactl get-default-sink`;

## run pactl and store output
open(my $fh, '-|', 'pactl list sinks');

## set the record seperator to consecutive newlines (same as -000)
## this means we read the info for each sink as a single "line"
$/="\n\n";

## Go through the pactl output
while (<$fh>) {
    ## if this is the sink we want
    if (/Name:.$sink/) {
        ## Extract current volume
        /Volume:.*?(\d+)%/;
        my $vol = $1;
        ## send notification, using gdbus so we can specify the
        ## id to update on report
        exec "gdbus call --session --dest org.freedesktop.Notifications --object-path /org/freedesktop/Notifications --method org.freedesktop.Notifications.Notify 'identifier' '999' '' 'Volume' '$vol%' '[]' '{\"value\": <$vol>}' '4000'";
    }
}