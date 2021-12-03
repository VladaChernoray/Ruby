def matrix_multiply_vector(matrix, vec)
  res = []
  (0...matrix.size).each do |i|
    sum = 0
    (0...matrix.size).each do |j|
      sum += vec[j] * matrix[i][j]
    end
    res << sum
  end
  res
end

def create_m(j, size, matrix)
  matrix_m = Matrix.identity(size).to_a
  matrix_m[j][j] = 1.fdiv matrix[j][j]
  ((j + 1)...size).each do |i|
    matrix_m[i][j] = -1.0 * (matrix[i][j].fdiv matrix[j][j])
  end
  Matrix[*matrix_m]
end

def create_p(i, j, size)
  matrix_p = Matrix.identity(size).to_a
  matrix_p[i], matrix_p[j] = matrix_p[j], matrix_p[i]
  Matrix[*matrix_p]
end

def find_line(current_index, matrix)
  max_index = current_index
  ((current_index + 1)...matrix.size).each do |i|
    max_index = i if matrix[i][current_index].abs > matrix[max_index][current_index].abs
  end
  max_index
end

def create_matrices(matrix)
  size = matrix.size
  matrix = Matrix[*matrix]
  res = Matrix.identity(size)
  (0...size).each do |i|
    j = find_line(i, matrix.to_a)
    matrix_p = create_p(i, j, size)
    res = matrix_p * res
    matrix = matrix_p * matrix
    matrix_m = create_m(i, size, matrix.to_a)
    res = matrix_m * res
    matrix = matrix_m * matrix
  end
  [matrix.to_a, res.to_a]
end

def reverse(vector_b, matrix)
  size = matrix.size
  x = Array.new(vector_b.size){ 0 }
  (size - 1).downto(0).each do |i|
    temp = 0.0
    ((i + 1)...size).each do |j|
      temp += matrix[i][j] * x[j]
    end
    x[i] = (vector_b[i] - temp).fdiv matrix[i][i]
  end
  x
end

def gaussian(matrix, b)
  matrix, res = create_matrices(matrix)
  b = matrix_multiply_vector(res, b)
  reverse(b, matrix)
end

matrix = [
  [1,2,5],
  [4,7,1],
  [9,1,2]
]
x = [1,2,3]
b = matrix_multiply_vector(matrix, x)
p gaussian(matrix, b)
