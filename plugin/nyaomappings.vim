fu! s:setup()
ruby << RUBY
module Nyao図
  def self.数集(str)     = str.split(' ').map(&:to_i).inspect
  def self.糸集(str)     = str.split(' ').inspect
  def self.、の間糸(str) = str.split(' ').map(&:inspect).join(', ')
  def self.、の間標(str) = str.split(' ').map{ ':' + _1.to_s }.join(', ')

  def self.装v(鍵, 為) = Ex.vno "#{鍵} :ruby C観選.new.全変 { Nyao図.#{為} _1 }<CR>"
  def self.装n(鍵, 為) = Ex.nno "#{鍵} :<C-u>let &opfunc='{ t -> rubyeval(\"C動選.new(C化[''t'']).全変 { Nyao図.#{為} _1 }\") }'<CR>g@"
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

Ex.nno 'rr r'

Nyao図.装v('ra', :糸集)
Nyao図.装n('ra', :糸集)
Nyao図.装v('rn', :数集)
Nyao図.装n('rn', :数集)
Nyao図.装v('rs', :、の間糸)
Nyao図.装n('rs', :、の間糸)
Nyao図.装v('ry', :、の間標)
Nyao図.装n('ry', :、の間標)
RUBY
endfu

call s:setup()

nno <CR> :ruby $cr装.行く<CR>
nno ,e :ruby $cr装.靄備わる<CR>
