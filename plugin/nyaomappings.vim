fu! s:setup()
ruby << RUBY
module Nyao図
  def self.数集(str)     = str.split(' ').map(&:to_i).inspect
  def self.糸集(str)     = str.split(' ').inspect
  def self.、の間糸(str) = str.split(' ').map(&:inspect).join(', ')
  def self.、の間標(str) = str.split(' ').map{ ':' + _1.to_s }.join(', ')

  def self.装v(鍵, 為) = Ex.vno "#{鍵} :ruby C観選.new.全変 { Nyao図.#{為} _1 }<CR>"
  def self.装n(鍵, 為) = Ex.nno "#{鍵} :<C-u>let &opfunc='{ t -> rubyeval(\"C動選.new(C化[''t'']).全変 { Nyao図.#{為} _1 }\") }'<CR>g@"
  def self.装(鍵, 為)
    Nyao図.装v(鍵, 為)
    Nyao図.装n(鍵, 為)
  end
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

装備図 = <<~MAPS
ra  糸集
rn  数集
rs  、の間糸
ry  、の間標
MAPS

装備図.split("\n").map { _1.split(' ') }.each {|(鍵, 為)| Nyao図.装(鍵, 為) }

Ex.nno '<CR> :ruby $cr装.行く<CR>'
Ex.nno ',e :ruby $cr装.靄備わる<CR>'
RUBY
endfu

call s:setup()
