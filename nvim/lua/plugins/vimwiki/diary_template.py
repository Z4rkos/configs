#!/usr/bin/python

import sys
import datetime
from datetime import date

school_days = ["Monday", "Tuesday", "Wednesday", "Thursday"]

today = datetime.date.today()
today_name = today.strftime("%A")

schoolday_template = """= {today_name}, {date} =
    
== Daily checklist ==

* [ ] Go to school
* [ ] Write notes for tomorrow
* [ ] Do some hacking OR coding
* [ ] Do some security research
* [ ] Excersice

== Notes =="""

weekend_template = """= {today_name}, {date} =

== Daily checklist ==

* [ ] Write notes if needed
* [ ] Do some hacking OR coding
* [ ] Do some security research
* [ ] Excersice
* [ ] Have some fun and chill ;)

== Notes =="""
    
try:
    date = (sys.argv[1].rsplit("/", 1)[-1]).split(".")[0]
except:
    date = today.strftime("%d-%m-%y")

if today_name in school_days:
    print(schoolday_template.format(today_name=today_name, date=date))
else:
    print(weekend_template.format(today_name=today_name, date=date))


