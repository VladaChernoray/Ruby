# Перевести число из двоичной системы в десятичную
def bin_dec(bin_string)
  split_binary = bin_string.split("")
  reversed_split_binary = split_binary.reverse
  binary_output = 0

  reversed_split_binary.each_with_index do |binary_input, index|
    binary_output += binary_input.to_i*2**index
  end
  binary_output
end
p bin_dec("1000010010010")


