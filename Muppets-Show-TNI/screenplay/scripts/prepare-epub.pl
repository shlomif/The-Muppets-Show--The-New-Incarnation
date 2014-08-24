#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use Shlomif::Screenplays::EPUB;

my $gfx = 'Muppet-Show-TNI-Logo--take1.svg.png';
my $obj = Shlomif::Screenplays::EPUB->new(
    {
        images =>
        {
            $gfx => "images/$gfx",
        },
    }
);
$obj->run;

my $filename = $obj->filename;

my $base_part = 'Muppets-Show--';
foreach my $part ($filename =~ /\A\Q$base_part\E([^\.]+)/g)
{
    my $epub_basename = "$base_part$part";
    $obj->epub_basename($epub_basename);

    $obj->output_json(
        {
            data =>
            {
                filename => $epub_basename,
                title => qq/The Muppets Show - The Next Incarnation - Part $part/,
                authors =>
                [
                    {
                        name => "Shlomi Fish",
                        sort => "Fish, Shlomi",
                    },
                ],
                contributors =>
                [
                    {
                        name => "Shlomi Fish",
                        role => "oth",
                    },
                ],
                cover => "images/$gfx",
                rights => "Creative Commons Attribution Noncommercial ShareAlike Unported (CC-by-nc-sa-3.0)",
                publisher => 'http://www.shlomifish.org/',
                language => 'en-GB',
                subjects => [ 'FICTION/Humorous', 'FICTION/Mashups', ],
                identifier =>
                {
                    scheme => 'URL',
                    value => 'http://www.shlomifish.org/humour/Muppets-Show-TNI/',
                },
            },
        },
    );
}
