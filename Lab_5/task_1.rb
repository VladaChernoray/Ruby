class CalculateIntegral
  def rectangle(a, b, n, dx = (b - a) / n)
    x = a + dx / 2
    temp = 0
    (1..n).each do
      y = yield(x)
      x += dx
      temp += dx * y
    end
    return temp
  end

  def trapezoid(a, b, n, dx = (b - a) / n)
    x = a + dx
    temp = dx * (yield(a) / 2 - yield(b) / 2)
    loop do
      y = yield(x)
      temp += dx * y
      x += dx
      break if x > b
    end
    temp
  end
end

def f(x)
  1.0/((x + 1.0)*(Math.sqrt(x**2.0 + 1.0)))
end

result = CalculateIntegral.new

puts result.rectangle(0.3, 0.4, 100.0){ |x| f(x) }
puts result.trapezoid(0.3, 0.4, 100.0){ |x| f(x) }


