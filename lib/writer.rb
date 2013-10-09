class Writer

  def write_to(filename)
    "Writing to #{filename}"
  end

  def mkdir
    if File.directory?("queue") == false
      Dir.mkdir("queue")
    end
  end

end 