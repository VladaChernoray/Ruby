class MathExpression
  def calculate(x, y, t, b)
    p = Math.sin((x).abs()/2)*(((y)**(1/5) + 1)/(Math.acos(t))) + b**(Math.sin(y)) * Math.log(Math.tan(Math::PI/4))
    puts p
  end
end

q = MathExpression.new
q.calculate(10, 0, 0, 1)
q.calculate(12, 9, 0, 0)
q.calculate(1, 12, 0.5, 2)
q.calculate(1, 5, 1, 2)
q.calculate(5, 0, 0, 0)
q.calculate(12, 0, 0, 1)
q.calculate(0, 0, 0, 0)
q.calculate(200, 0, 1, 1)


