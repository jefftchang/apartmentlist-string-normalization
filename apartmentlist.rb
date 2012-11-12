while true
  puts "Enter path to normalize (Ctrl c to quit):"
  newline = []
  input = gets
  input.chomp.split('/').each do |f|
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