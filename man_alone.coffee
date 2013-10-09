[rest..., chan] = process.argv
[chan, moment, irc, {log}] = ["##{chan}", require('moment'), require('irc'), console]

(@man = new irc.Client 'irc.freenode.net', 'man_alone', channels:[ chan ]).addListener "error", (m)-> log m

the_hour = -> moment().format('h')
our_hour = the_hour()

@man.chimes = =>
  @man.say chan, "*chime* The hour is: #{ the_hour() }" if the_hour() isnt our_hour and our_hour = the_hour()

setInterval @man.chimes, 5000