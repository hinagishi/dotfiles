#!/usr/bin/perl

$latex = 'platex -synctex=1 %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
$pdf_mode = 3;

$os = `uname -s`;
if ($os eq 'Darwin') {
    $pdf_previewer = 'open -a preview';
} elsif ($os eq 'Linux') {
    $pdf_previewer = 'evince';
}
