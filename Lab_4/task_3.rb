require 'matrix'

def multiple_by_number(matrix, number)
  arr = matrix.to_a
  arr.map! { |item| item.map! { |val| val * number } }

end

def add(matrix1, matrix2)
  matrix1 + matrix2
end

def transpose_matrix(matrix)
  matrix.transpose
end

def multiply(matrix1, matrix2)
  matrix1 * matrix2
end

def trace(matrix)
  matrix.trace
end

def dot(vec1, vec2)
  vec1.inner_product(vec2)
end

def cross(vec1, vec2)
  vec1.cross_product(vec2)
end

def norm(vec)
  vec.norm
end

def vector_multiply_matrix(vec, matrix)
  res = []
  (0...matrix.column_count).each do |j|
    sum = 0
    (0...matrix.row_count).each do |i|
      sum += vec[i] * matrix.element(i, j)
    end
    res << sum
  end
  Vector[*res]
end

def matrix_multiply_vector(matrix, vec)
  res = []
  (0...matrix.row_count).each do |i|
    sum = 0
    (0...matrix.column_count).each do |j|
      sum += vec[j] * matrix.element(i, j)
    end
    res << sum
  end
  Vector[*res]
end

matrix1 = Matrix[[1, 2, 3], [3, 4, 5], [6, 7, 8]]
matrix2 = Matrix[[1, 2, 3], [3, 4, 5], [6, 7, 8]]
vec1 = Vector[1, 2, 3]
vec2 = Vector[2, 3, 4]
multiple_by_number(matrix1, 5)
add(matrix1, matrix2)
transpose_matrix(matrix1)
multiply(matrix1, matrix2)
trace(matrix1)
dot(vec1, vec2)
cross(vec1, vec2)
norm(vec1)
vector_multiply_matrix(vec1, matrix1)
matrix_multiply_vector(matrix1, vec1)
