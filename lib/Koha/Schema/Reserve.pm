package Koha::Schema::Reserve;

use strict;

use base qw(Koha::Schema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'reserves',

    columns => [
        reservenumber    => { type => 'serial', not_null => 1 },
        borrowernumber   => { type => 'integer', default => '0', not_null => 1 },
        reservedate      => { type => 'datetime' },
        biblionumber     => { type => 'integer', default => '0', not_null => 1 },
        constrainttype   => { type => 'varchar', length => 1 },
        branchcode       => { type => 'varchar', length => 10 },
        notificationdate => { type => 'date' },
        reminderdate     => { type => 'date' },
        cancellationdate => { type => 'date' },
        reservenotes     => { type => 'scalar', length => 16777215 },
        priority         => { type => 'integer' },
        found            => { type => 'varchar', length => 1 },
        timestamp        => { type => 'timestamp', not_null => 1 },
        itemnumber       => { type => 'integer' },
        waitingdate      => { type => 'date' },
        expirationdate   => { type => 'date' },
        displayexpired   => { type => 'integer', default => 1, not_null => 1 },
    ],

    primary_key_columns => [ 'reservenumber' ],

    foreign_keys => [
        biblio => {
            class       => 'Koha::Schema::Biblio',
            key_columns => { biblionumber => 'biblionumber' },
        },
        borrower => {
            class       => 'Koha::Schema::Borrower',
            key_columns => { borrowernumber => 'borrowernumber' },
        },
        item => {
            class       => 'Koha::Schema::Item',
            key_columns => { itemnumber => 'itemnumber' },
        },
        branch => {
            class       => 'Koha::Schema::Branch',
            key_columns => { branchcode => 'branchcode' },
       },
    ],
);

1;

