fu! s:setup()
ruby << RUBY
module NyaoMappings
  def self.array_of_nums(str)           = str.split(' ').map(&:to_i).inspect
  def self.array_of_strings(str)        = str.split(' ').inspect
  def self.comma_separated_strings(str) = str.split(' ').map(&:inspect).join(', ')
  def self.comma_separated_symbols(str) = str.split(' ').map{ ':' + _1.to_s }.join(', ')
end

$enter_equipment = NyaoEquip.new
$enter_equipment << (NyaoEquip::Equipment.new 'source vim', -> { Ex.source Ev.expand('%') })
$enter_equipment << (NyaoEquip::Equipment.new 'run current file in ruby', -> { Vim.command "!ruby %" })
$enter_equipment << (NyaoEquip::Equipment.new 'run macro', -> { Ex.normal! "@q" })
$enter_equipment.equip 'source vim'

RUBY
endfu

call s:setup()

vno ,ra :ruby VisualSelection.new.replace_all { NyaoMappings.array_of_strings _1 }<CR>
nno ,ra :<C-u>let &opfunc='{ t -> rubyeval("MotionSelection.new(Var[''t'']).replace_all { NyaoMappings.array_of_strings _1 }") }'<CR>g@

vno ,rs :ruby VisualSelection.new.replace_all { NyaoMappings.comma_separated_strings _1 }<CR>
nno ,rs :<C-u>let &opfunc='{ t -> rubyeval("MotionSelection.new(Var[''t'']).replace_all { NyaoMappings.comma_separated_strings _1 }") }'<CR>g@

vno ,rn :ruby VisualSelection.new.replace_all { NyaoMappings.array_of_nums _1 }<CR>
nno ,rn :<C-u>let &opfunc='{ t -> rubyeval("MotionSelection.new(Var[''t'']).replace_all { NyaoMappings.array_of_nums _1 }") }'<CR>g@

vno ,ry :ruby VisualSelection.new.replace_all { NyaoMappings.comma_separated_symbols _1 }<CR>
nno ,ry :<C-u>let &opfunc='{ t -> rubyeval("MotionSelection.new(Var[''t'']).replace_all { NyaoMappings.comma_separated_symbols _1 }") }'<CR>g@

nno <CR> :ruby $enter_equipment.execute<CR>
nno ,e :ruby $enter_equipment.fzf_equip<CR>
