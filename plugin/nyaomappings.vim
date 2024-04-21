fu! s:setup()
ruby << RUBY
module Nyao図
  def self.数集(str)     = str.split(' ').map(&:to_i).inspect
  def self.糸集(str)     = str.split(' ').inspect
  def self.、の間糸(str) = str.split(' ').map(&:inspect).join(', ')
  def self.、の間標(str) = str.split(' ').map{ ':' + _1.to_s }.join(', ')
end

C選 = Selection
C選.alias_method :全変, :replace_all

C観選 = VisualSelection
C動選 = MotionSelection
C化   = Var

$cr装 = Nyao装.new
$cr装 << (Nyao装::C服.new 'source vim', -> { Ex.source   Ev.expand('%') })
$cr装 << (Nyao装::C服.new 'run ruby',   -> { Vim.command "!ruby %"      })
$cr装 << (Nyao装::C服.new 'run macro',  -> { Ex.normal!  "@q"           })
$cr装.備わる 'source vim'

RUBY
endfu

call s:setup()

nno rr r

vno ra :ruby C観選.new.全変 { Nyao図.糸集     _1 }<CR>
vno rn :ruby C観選.new.全変 { Nyao図.数集     _1 }<CR>
vno rs :ruby C観選.new.全変 { Nyao図.、の間糸 _1 }<CR>
vno ry :ruby C観選.new.全変 { Nyao図.、の間標 _1 }<CR>

nno ra :<C-u>let &opfunc='{ t -> rubyeval("C動選.new(C化[''t'']).全変 { Nyao図.糸集     _1 }") }'<CR>g@
nno rn :<C-u>let &opfunc='{ t -> rubyeval("C動選.new(C化[''t'']).全変 { Nyao図.数集     _1 }") }'<CR>g@
nno rs :<C-u>let &opfunc='{ t -> rubyeval("C動選.new(C化[''t'']).全変 { Nyao図.、の間糸 _1 }") }'<CR>g@
nno ry :<C-u>let &opfunc='{ t -> rubyeval("C動選.new(C化[''t'']).全変 { Nyao図.、の間標 _1 }") }'<CR>g@

nno <CR> :ruby $cr装.行く<CR>
nno ,e :ruby $cr装.靄備わる<CR>
