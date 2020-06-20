a = 1
b = 2

my_proc = Proc.new { p c }

c = 3
my_proc.call 

p local_variables

