# solution 3
def calculate_3(n, x)
  sum = 0.0
  for k in 0..n
    sum += (x**k)/factorial(k)
  end
  puts sum
end
def factorial(num)
  return 1 unless num > 0
  num * factorial(num - 1)
end
calculate_3(2, 10.0)
# solution 2
def calculate_2()
  sum = 0
  for x in 0..8
    sum += ((1.0/3)**x)
  end
  puts sum
end
calculate_2()
