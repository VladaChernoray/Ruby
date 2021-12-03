# task 1
def calculation_1(n, c)
  (1..n).step((n-1.0)/(n + c)) {|x|
    y = (x**(1.0/4) - x**(-1.0/4))**(-n) + (x + 1.0)/(x**2 - 4.0*x +3.0 * n) +(36.0 * c * x * n)**(1.0/4)/((x + c*n +1.0)/(x + 5.0))
    puts y }
end
calculation_1(10, 2)
puts "***********************************************************"
# task 2
def calculation_2(n, c)
  pi = 3.141
  (pi/n..pi).step((3.141 - 3.141 / n)/(3 / 2 * n + c)) {|x|
    z = (Math.tan(2*x)*Math.cos(2*x)**(-1) - Math.tan(2*c +x)*Math.cos(2*x)**(-2))/(Math.cos(2*x)**(-1) + Math.cos(3*x)**(-2)) + (1+ Math.cos(n * x)**(1/c))/(2*x + 3 * Math.sin(3*x)**2)
    puts z }
end
calculation_2(10, 2)
# task 3
puts "*************************************************************"
def calculation_3(n , c)
  for x in 2..c
    if x > 2.0 && x < c
      (2.0..n).step((n - 2.0)/2.0*n)  {|x|
        f = (x**(1.0/4) - x**(-1.0/4))**(-n) + (x + 1.0)/(x**2 - 4.0*x +3.0 * n) +(36.0 * c * x * n)**(1.0/4)/((x + c*n +1.0)/(x + 5.0))
        puts f }
    elsif x > n && x < 2*n
      (n..2.0*n).step((2.0*n - n)/2*n) {|x|
        f = (Math.tan(2*x)*Math.cos(2*x)**(-1) - Math.tan(2*c +x)*Math.cos(2*x)**(-2))/(Math.cos(2*x)**(-1) + Math.cos(3*x)**(-2)) + (1+ Math.cos(n * x)**(1/c))/(2*x + 3 * Math.sin(3*x)**2)
        puts f }
    else
      (2.0..c).step((c - 2.0)/2*n)  {|x|
        f = (x**(1.0/4) - x**(-1.0/4))**(-n) + (x + 1.0)/(x**2 - 4.0*x +3.0 * n) +(36.0 * c * x * n)**(1.0/4)/((x + c*n +1.0)/(x + 5.0))+(Math.tan(2*x)*Math.cos(2*x)**(-1) - Math.tan(2*c +x)*Math.cos(2*x)**(-2))/(Math.cos(2*x)**(-1) + Math.cos(3*x)**(-2)) + (1+ Math.cos(n * x)**(1/c))/(2*x + 3 * Math.sin(3*x)**2)
        puts f}
    end
  end
end
calculation_3(100, 7)