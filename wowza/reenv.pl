use strict;
use warnings;
while (<>)
{
    while (m/\$((\w+))/ || m/\$(\{(\w+)\})/)
    {
        my $key = $2;
        my $var = $1;
        $var =~ s/([{}])/\\$1/g;
        s/\$$var/$ENV{$key}/g if defined $ENV{$key};
    }
    print;
}
