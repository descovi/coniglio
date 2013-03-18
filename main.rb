require './coniglio'

c = Coniglio.new
p "Quanti minuti vuoi che corra il tuo Coniglio?"
a = gets.chomp
c.run a