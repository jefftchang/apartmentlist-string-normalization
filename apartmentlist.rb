def split_path(s)
  path_array = []
  current_string = ""
  s.each_char do |c|
    if c == "/"
      path_array.push(current_string)
      current_string = ""
    else
      current_string += c
    end
  end
  path_array.push(current_string)
  return path_array
end

while true
  puts "Enter path to normalize (Ctrl c to quit):"
  newline = []
  input = gets
  split_path(input.chomp).each do |f|
    if f == ".."
      newline.pop()
    elsif f != "."
      newline.push(f)
    end
  end
  if newline.count == 0
    puts input
  else
    puts newline.join("/")
  end
end