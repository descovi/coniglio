class Bank

  def self.save_chronichles input, pre_phrase
    File.open('relation.md', 'a') { |file| file.puts("#{pre_phrase} #{input}") }
    fork{ exec 'afplay', 'test.mp3' }
  end

end
