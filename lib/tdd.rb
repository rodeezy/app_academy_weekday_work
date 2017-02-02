class Array

  def my_uniq
    result = []
    each { |el| result << el unless result.include? el }
    result
  end

  def two_sum
    result = []
    i = 0
    while i < length - 1
      j = i + 1
      while j < length
        result << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    result
  end

  def my_transpose
    result = Array.new(self[0].length) { Array.new(self.length)}
    each_with_index do |row, i|
      row.each_with_index do |el, j|
        result[i][j] = self[j][i]
      end
    end
    result
  end

  def stock_picker
    result = []
    max_earnings = 0
    i = 0
    while i < length - 1
      j = i + 1
      while j < length
        if self[j] - self[i] > max_earnings
          result = [i, j]
          max_earnings = self[j] - self[i]
        end
        j += 1
      end
      i += 1
    end
    result
  end
end
