# Перевести число из десятичной системы в двоичную
def binary_convert(input)
  number = input.to_i
  position = 0
  binary_store = []

  while 2**position <= number do
    position += 1
  end

  position -= 1

  position.downto(0) do |base_power|
    if(number - 2**base_power >= 0)
      binary_store << "1"
      number -= 2**base_power
    else
      binary_store << "0"
    end
  end

  binary_store.join("").to_i
end

puts binary_convert("145")
