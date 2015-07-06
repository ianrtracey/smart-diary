def get_sender(line)
	if line.include? "Ian's iphone"
		"Ian"
	else
		"Savannah"
	end
end

File.open("data.txt", "r").each_line do |line|
  l = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  sender = get_sender(l)
    out = sender + l.split(":").last
      if out.include? "=" 
  		out =  sender + "<emoji>"
  	  end
  	 puts out
end
$stdout = File.new('console.out', 'w')



