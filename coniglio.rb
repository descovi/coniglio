require 'chronic_duration'
class Coniglio


  def run _minutes, _task=""
  	p 'Il Coniglio corre di brutto'
    p Time.now
    @task = _task
    if _minutes.nil? or _minutes.empty?
      _minutes = 25
      count_minutes _minutes.to_i
    end

    save_chronichles
  end

  private

  def count_minutes minutes
    tot = minutes * 60
    tot.times do |second|
      sleep 1
      time_output = ChronicDuration.output(tot - second, format: :micro)
      p "#{time_output} #{@task}"
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

