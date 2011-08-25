lsof—show open files

lsof -nPp <pid>
strace

summary mode, run it for a while and then hit ^C
strace -cp <pid>
OR

system call and arguments as they are happening
strace -ttTp <pid> -o <file>
ruby 1.8 uses signals to schedule its green threads. process receives a SIGVTALRM signal every 10ms
in summary mode, you see a lot of calls sigprocmask (ruby bug, shows up in linux distribution ruby because compiled w/pthread as it is spawning thread to do signaling)
tcpdump

tcpdump -i eth0 -s <len> -nqA <expr>
dumps to file, and then open file in wireshark for further analysis
tcpdump -w <file>
PERFTOOLS, google’s performance tools

download and compile, setup, profile and report

pprof ruby ruby.prof [--text|--gif]
gem install perftools.rb
only interested in ruby c calls
real time (wall time) vs. CPU time
perftools does a good job helping you understand a code base as you can see the function call graph
also has object allocation profile
ltrace

ltrace -cp <pid>
ltrace -ttTp <pid> -o <file>
traces library calls as opposed to strace does system calls.
joe domato – new maintainer of ltrace
no good ltrace on os x. no good strace on mac os x. dtrace works on mac os x but doesn’t replicate all the functionality of strace and ltrace
gdb

gdb <executable>
gdb attach <pid>
Two ways to use it 1. Attach to a running process 2. Use a coredump
gdb.rb—gdb with MRI hooks
gem install gdb.rb
gdb.rb (does not work w/1.9 but work is being done on it or OS X) gdb 7 not compatible on OS X
memprof—a heap visualizer for ruby

gem install memprof
memprof.track
like bleak_house, but for a given block of code
use memprof::Middleware in your webapps to run track per request
memprof.dump
shows you details about objects created during that block. json output
memprof.dump_all
dump out every single live object as json
one per line to specified file
couple hundred mb file
analyze via
jsawk/grep
custom ruby scripts
mongodb
...
memprof.com—fantastic!!
a web-based heap visualizer and leak analyzer
rack-perftools—rack middleware for perftools.rb

gem install rack-perftools_profiler
middleware that adds urls to app that, if special params are included, intercepts a request and returns profile info!
