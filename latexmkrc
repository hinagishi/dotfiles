#!/usr/bin/perl

$latex = 'extractbb *.jpg && platex -synctex=1 %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
$pdf_mode = 3;

if ($^O eq 'darwin') {
    $pdf_previewer = 'open -a skim';
} elsif ($^O eq "linux") {
    $pdf_previewer = 'evince';
}

