require 'chronic_duration'
require 'ruby-growl'

require './bank'
class Coniglio

  def run _minutes, _task=""
    now = Time.now
    time = now.strftime("%Y-%m-%d %H:%M:%S")
    Bank.save_chronichles _task, "\n#{time}\nvolevi fare: "
    p 'Il Coniglio corre di brutto'
    @task = _task
    if _minutes.nil? or _minutes.empty? or _minutes.to_i == 0
      _minutes = 25
    end
    count_minutes _minutes.to_i, task
    p 'Coniglio spiattellato, che hai fatto?'
    Bank.save_chronichles gets.chomp, 'hai fatto: '
  end

  def count_minutes minutes, task
    tot = minutes * 60
    counting tot, task
    pid = fork{ exec 'afplay', 'test.mp3' }
  end

  def counting tot, task
    growl = Growl.new "localhost", "ruby-growl"
    tot.times do |second|
      sleep 1
      time_output = ChronicDuration.output(tot - second, :format => :micro)
      output = "#{time_output} #{task}"
      multiplier = second % 30
      if multiplier == 0
        growl.add_notification "ruby-growl Notification"
        if time_output == "5m"{
          growl.notify "ruby-growl Notification", time_output, "Scrivi quanto fatto BRUTTA MERDA"
        } else {
          growl.notify "ruby-growl Notification", time_output, task
        }
      end
      p output
    end
  end

end

