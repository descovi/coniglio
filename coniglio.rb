require 'chronic_duration'
class Coniglio
  

  def run
  	p 'Corro'
    p Time.now

    count_minutes 0#25
    save_chronichles
  end

  private
  
  def count_minutes minutes
    tot = minutes * 60
    tot.times do |second|
      sleep 1
      p ChronicDuration.output(tot - second)
    end
    pid = fork{ exec 'afplay', 'test.mp3' }
  end

  def save_chronichles
    p Time.now
	p 'Coniglio spiattellato, che hai fatto?'
    a = gets.chomp
    p "a"
    fork{ exec 'afplay', 'test.mp3' }
  end
end

