def calculate(x, n)
  e = 0.0001
  ln_restriction = 10
  rn_restriction = 58
  lx_restriction = 0.1
  rx_restriction = 1
  if x > lx_restriction && x < rx_restriction
  sum = 0
  if n >= ln_restriction && n <= rn_restriction
    (0..n).each do |i|
      sum += yield(x, i)
    end
  else

    fault = e + 1
    temp = sum
    i = 0
    while i < 100 || fault > e
      sum += yield(x, i)
      i += 1
      fault = (temp - sum).abs
      temp = sum
    end
    end
  end
  puts sum
end

def series(x, i)
  Math.log(3) ** i * x ** i  / factorial(i)
end

def factorial(num)
  return 1 unless num > 0
  num * factorial(num - 1)
end

calculate(0.2, 1000) {|x, i| series(x, i)}

