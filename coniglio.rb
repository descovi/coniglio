require 'chronic_duration'
class Coniglio
  def corri

    p 'corro'
    tot = 120
    tot.times do |second|
      sleep 1
      puts ChronicDuration.output(tot - second)
    end
    p 'arrivato'
  end
end

c = Coniglio.new
c.corri