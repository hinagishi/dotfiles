#!/usr/bin/perl

$latex = 'platex -synctex=1 %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
$pdf_mode = 3;

if ($^O eq 'Darwin') {
    $pdf_previewer = 'open -a preview';
} elsif ($^O eq "linux") {
    $pdf_previewer = 'evince';
} 

