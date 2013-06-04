require './coniglio'

c = Coniglio.new
p "Quanti minuti vuoi che corra il tuo Coniglio?"
minutes = gets.chomp
p "Come vuoi utilizzare questi minuti?"
task = gets.chomp
c.run minutes, task
