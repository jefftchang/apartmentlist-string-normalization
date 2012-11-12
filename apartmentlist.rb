newline = []
gets.chomp.split('/').each do |f|
  if f == ".."
    newline.pop()
  elsif f != "."
    newline.push(f)
  end
end
puts newline.join("/")