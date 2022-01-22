module Utils
  def Utils.date_fragment(date)
    return date[0..9]
  end

  def Utils.log(file_name, string)
    open("./tmp/#{file_name}.json", "a") { |f| f.puts string}
  end
end
