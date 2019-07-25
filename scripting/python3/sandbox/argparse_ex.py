#!/usr/bin/env python3
import argparse
from datetime import datetime

parser = argparse.ArgumentParser()
parser.add_argument('--date', type=lambda d: datetime.strptime(d, '%Y%m%d'), default=datetime.today().strftime("%Y%m%d"))
args = parser.parse_args()

date = args.date  
print(args.date.strftime('%Y%m%d'))