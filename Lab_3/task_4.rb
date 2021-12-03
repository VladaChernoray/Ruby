def calculate_1()
  sum = 0.0
  for n in 2..Float::INFINITY
    sum += ((factorial(n - 1.0))/(factorial(n + 1.0)))**(n*(n + 1.0))
    #puts sum.round(5)
  end
  #puts sum.round(5)
end

def factorial(num)
  return 1 unless num > 0
  num * factorial(num - 1)
end
calculate_1()

def calculate_2(x)
  sum = 0.0
  e = 0.00001
  n = 0.0
  loop do
    temp = 2*((x - 1)**(2*n + 1))/((2*n + 1)*(x + 1)**(2*n +1))
    n++
    sum += temp
    break if temp < e
    puts sum
  end
end
calculate_2(2)