Attach to the process
Attach to the process, load the ruby helpers, and redirect stdout:

$ gdb /usr/bin/ruby 21170
The first argument to gdb should be the full path to the ruby executable that is running your script.

Start your debug session
From above, you should see a bunch of output like this:

...
Loaded symbols for /srv/ruby/1.8.6/lib/ruby/1.8/i686-linux/nkf.so
0xbfffe402 in +kernel_vsyscall ()
And then you’ll wind up at:

(gdb)
First things first, load up the ruby helpers:

(gdb) session-ruby
Then, redirect stdout to a file, so we can capture the output for later:

(gdb) redirect_stdout
Open up a second terminal, and you can watch the output from your debug session:

$ tail -f /tmp/ruby-debug.PID
Where PID above is equal to the PID you attached to with gdb.

Now that you are watching, flip back to your gdb session and…

Get some data
Now you can retrieve some data:

(gdb) eval "caller"
(gdb) rb_object_counts
(gdb) eval "total = \[\[ObjectSpace\]\].each_object(Array)\{\|x\| puts '---'; p x \}; puts \\"---\\nTotal Arrays: \#{total}\\""

