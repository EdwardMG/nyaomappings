fu! s:setup()
ruby << RUBY
module NyaoMappings
  def self.array_of_strings(str)        = str.split(' ').inspect
  def self.comma_separated_strings(str) = str.split(' ').map(&:inspect).join(', ')
end
RUBY
endfu

call s:setup()

vno ,ra :ruby VisualSelection.new.replace { NyaoMappings.array_of_strings _1 }<CR>
nno ,ra :<C-u>let &opfunc='{ t -> rubyeval("MotionSelection.new(Var[''t'']).replace { NyaoMappings.array_of_strings _1 }") }'<CR>g@

vno ,rs :ruby VisualSelection.new.replace { NyaoMappings.comma_separated_strings _1 }<CR>
nno ,rs :<C-u>let &opfunc='{ t -> rubyeval("MotionSelection.new(Var[''t'']).replace { NyaoMappings.comma_separated_strings _1 }") }'<CR>g@


