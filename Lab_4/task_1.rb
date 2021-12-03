def task_1(array)
  res = Array.new(array.max + 1) { 0 }
  array.each { |item| res[item] += 1 }
  same = []
  array.each { |item| same << item if res[item] > 1 }
  matrix = []
  same.uniq.each { |item| matrix << Array.new(res[item]) { item } }
  matrix
end

def task_2(array)
  sum_value = 0
  sum_index = 0
  array.each_index do |i|
    if array[i].to_i.even?
      sum_value += array[i].to_i
      sum_index += i
    end
  end
  [sum_value, sum_index]
end

def task_3(array_1, array_2)
  array_1 & array_2
end

def task_4(array)
  array.unshift(array.pop)
end

def task_5(array)
  result = array.reject(&:nonzero?)
  array -= result
  result += array.reject(&:positive?)
  array -= result
  result + array
end

def task_6(array)
  sum_1 = array.inject(0) do |sum, item|
    if item.even? && item.negative?
      sum + item
    else sum
    end
  end
  sum_2 = array.inject(0) do |sum, item|
    if item.odd? && item.positive?
      sum + item
    else sum
    end
  end
  [sum_1, sum_2]
end
task_6([-1, 0, 1, 2, 0, -3, 4, -2, 0, 1, -5])
def task_7(arr1, arr2)
  task_3(arr1, arr2)
end
task_7([1, 1, 2, 3, 4, 2, 1, 5], [0, 1, 2, 8, 2, 1, 11, 5])
def task_8(array)
  count = Array.new(array.max + 1) { 0 }
  array.each { |item| count[item] += 1 }
  result = []
  array.each do |item|
    result << if count[item] > 1
             count[item]
           else
             item
           end
  end
  result
end
task_8([1, 1, -2, 3, 4, -2, 1, 5])
def task9(arr)
  res = []
  arr.each_index { |i| res << i if arr[i].zero? }
  arr.each_index { |i| res << i if arr[i].negative? }
  arr.each_index { |i| res << i if arr[i].positive? }
  res
end

def task_10(array_1, array_2)
  array_2.reject(&:odd?) + array_2.reject(&:even?) +
    array_1.reject(&:even?) + array_1.reject(&:odd?)
end

def task_11(array)
  part1 = array.slice(0, array.size / 2)
  part2 = array.slice(array.size / 2, array.size)
  part1.reverse + part2.reverse
end

def task_12(array_1, array_2)
  result = []
  if array_1.size == array_2.size
    array_1.each_index { |i| result << (array_1[i].to_i + array_2[i].to_i) if array_1[i].to_i.even? }
    array_1.each_index { |i| result << (array_1[i].to_i + array_2[i].to_i) if array_1[i].to_i.odd? }
  end
  result
end
