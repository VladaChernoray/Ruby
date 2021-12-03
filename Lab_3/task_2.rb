def calculate_case(x)
  case x
  when -4..0
    y = (((x-2).abs)/(x**2 * Math.cos(x)))**(1/7)
  when 0..12
    y = (((Math.tan(x + (Math::E)**(-x))/(Math.sin(x)**2))**(-7/2)))
    else
    y =(1/(1 + (x/(1 + (x/(1 + x))))))
  end
end
def calculate_if(x)
  if x > -4 && x <= 0
    y = (((x-2).abs)/(x**2 * Math.cos(x)))**(1/7)
  end
  if x > 0 && x <= 12
    y = (((Math.tan(x + (Math::E)**(-x))/(Math.sin(x)**2))**(-7/2)))
  end
  if x < 4 && x > 12
    y =(1/(1 + (x/(1 + (x/(1 + x))))))
  end
end