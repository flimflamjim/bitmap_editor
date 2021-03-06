class CommandProcessor
  def self.create(number_of_columns, number_of_rows)
    bitmap_array = []
    number_of_rows.times do
      bitmap_array << create_row(number_of_columns)
    end
    bitmap_array
  end

  def self.set_pixel(bitmap_array, column_number, row_number, colour)
    bitmap_array[row_number - 1][column_number - 1] = colour
    bitmap_array
  end

  def self.clear(bitmap_array)
    bitmap_array.each do |row|
      row.map! { |_pixel| "O" }
    end
    bitmap_array
  end

  def self.draw_vertical_line(bitmap_array, column, start_row, end_row, colour)
    start_point = (start_row < end_row) ? start_row : end_row
    end_point = (start_row < end_row) ? end_row : start_row
    (start_point - 1).upto(end_point - 1) do |index|
      bitmap_array[index][column - 1] = colour
    end
    bitmap_array
  end

  def self.draw_horizontal_line(bitmap_array, start_column, end_column, row, colour)
    start_point = (start_column < end_column) ? start_column : end_column
    end_point = (start_column < end_column) ? end_column : start_column
    target_row = bitmap_array[row - 1]
    (start_point - 1).upto(end_point - 1) do |index|
      target_row[index] = colour
    end
    bitmap_array
  end

  private

  def self.create_row(number_of_columns)
    row = []
    number_of_columns.times do
      row << "O"
    end
    row
  end
end
