=begin
Meetups
Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on 
the same day of the week. For example, a meetup's meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The teenth wednesday of December 2020
The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date. Each object takes a month number 
(1-12) and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in 
the specified month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should 
be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', 
and 'teenth'. The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. 
Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 
7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) 
will have exactly one date that is the "teenth" of that day in every month. That is, every month has 
exactly one "teenth" Monday, one "teenth" Tuesday, etc. The fifth day of the month may not happen every 
month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 
'Saturday', and 'Sunday'. Again, the case of the strings is not important.
=end