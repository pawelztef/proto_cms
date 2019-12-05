require "awesome_print"
require 'rb-readline'

AwesomePrint.pry!

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

def RbReadline.rl_reverse_search_history(sign, key)
  rl_insert_text  `cat ~/.pry_history | fzf --tac |  tr '\n' ' '`
end
