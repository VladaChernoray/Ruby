def calculate(t, r, p)
  diap = p**r * (1.0 - p**(1.0/t))
  puts diap
end
calculate(3.0, 8.0, 0.0)