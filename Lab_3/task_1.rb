def a(a,b)
  puts !(a or b) and (a and !b)
end
a(true, false)

def b(x, y, z, a, b, c)
  puts  z != y and (6 >= y) and a or b and c and x >= 1.5
end
b(2, 10, -50, true, false, true)

def c(x, y, z)
  puts 8 - x*2 <= z and (x**2 <=> y**2) or (z >= 15)
end
c(2, 10, -50)

def d(x, y, z)
  puts x > 0 and y < 0 or z >= (x * y + (-y/x)) + (-z)*(-2)
end
d(2, 10, -50)

def g(a, b ,c)
  puts !(a or b and !(c or (!a or b)))
end
g(true, false, true)

def h(x, y)
  puts x**2 + y**2 >= 1 and x >= 0 and y >= 0
end
h(2, 10)

def i(a, b, c)
  puts (a and ((c and b) <=> (b or a)) or c) and b
end
i(true, false, true)
#2
def j(a, p)
  puts ((Math.log(a) > a) or !p) and (Math.sqrt(a) < a**4)
end
j(2.5, true)