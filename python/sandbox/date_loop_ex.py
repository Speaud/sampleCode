#!/usr/bin/env python3
import argparse
import datetime

# Create an ArgumentParser object
parser = argparse.ArgumentParser(
    prog            = 'BACKFILL_DATA',
    description     = 'Backfill - Process Prior Data',
    epilog          = "And that's how you'd foo a bar",
    formatter_class = argparse.ArgumentDefaultsHelpFormatter, # automatically adds information about default values to each of the argument help messages
    allow_abbrev    = False) # enable abbreviation ambiguous/ambiguity, no parital matching

# Add optional args
parser.add_argument('-e', '--end-date', default=datetime.date.today(), help='foo help')

# Add positional args (required by default?)
# parser.add_argument('bar', nargs='+', help='bar help')

# Add required args to a group
requiredArguments = parser.add_argument_group('required named arguments')
requiredArguments.add_argument('-s', '--start-date', type=lambda d: datetime.datetime.strptime(d, '%Y-%m-%d').date(), help='format MM-DD-YYYY', required=True)

args = parser.parse_args()


print(args)

if __name__ == "__main__":
    day_count = abs((args.start_date - args.end_date).days)
    offset_day_count = day_count + 1 # this will include the date of the `start_date`

    backfill_dates = list()

    for i in range(0, offset_day_count):
        backfill_dates.insert(0, args.end_date - datetime.timedelta(days=i))

    for backfill_date in backfill_dates:
        print(backfill_date)