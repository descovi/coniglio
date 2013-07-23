require './coniglio'

coniglio = Coniglio.new
p "Quanti minuti vuoi che corra il tuo Coniglio?"
minutes = gets.chomp
p "Come vuoi utilizzare questi minuti?"
task = gets.chomp
coniglio.run minutes, task
