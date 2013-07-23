require 'chronic_duration'
require 'ruby-growl'

class Coniglio

  def run _minutes, _task=""

  	p 'Il Coniglio corre di brutto'
    p Time.now
    @task = _task
    if _minutes.nil? or _minutes.empty?
      _minutes = 25
    end
    count_minutes _minutes.to_i

    save_chronichles
  end

  private

  def count_minutes minutes
    tot = minutes * 60
    growl = Growl.new "localhost", "ruby-growl"
    tot.times do |second|
      sleep 1
      time_output = ChronicDuration.output(tot - second, :format => :micro)
      output = "#{time_output} #{@task}"
      multiplier = second % 30
      if multiplier == 0
        growl.add_notification "ruby-growl Notification"
        growl.notify "ruby-growl Notification", time_output, @task
      end
      p output
    end
    pid = fork{ exec 'afplay', 'test.mp3' }
    p pid.inspect
  end

  def save_chronichles
    p Time.now
    p 'Coniglio spiattellato, che hai fatto?'
    a = gets.chomp
    p "a.. #{a}"
    fork{ exec 'afplay', 'test.mp3' }
  end
end

