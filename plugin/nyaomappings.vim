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

module Misc
  def self.run_repeat_on_each
    cnum = Ev.col('.')
    VisualSelection.new.lnums.each do |lnum|
      Ev.cursor lnum, cnum
      N["."] if Ev.getline('.').length >= cnum
    end
  end

  def self.run_macro_on_each reg='q'
    cnum = Ev.col('.')
    VisualSelection.new.lnums.each do |lnum|
      Ev.cursor lnum, cnum
      N["@#{reg}"] if Ev.getline('.').length >= cnum
    end
  end
end

C選 = Selection
C選.alias_method :全変, :replace_all

C観選 = VisualSelection
C動選 = MotionSelection
C化   = Var

$cr装 = Nyao装.new
$cr装 << (Nyao装::C服.new 'source vim', -> { Ex.write;  Ex.source   "%"       })
$cr装 << (Nyao装::C服.new 'run ruby',   -> { Ex.write;  Vim.command "!ruby %" })
$cr装 << (Nyao装::C服.new 'run js',   -> { Ex.write;  Vim.command "!node %"   })
$cr装 << (Nyao装::C服.new 'run macro',  -> { Ex.normal! "@q"                  })
# $cr装.備わる 'source vim'
$cr装.備わる 'source ruby'

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

nno <nowait> <Space>1 :1wincmd w<CR>
nno <nowait> <Space>2 :2wincmd w<CR>
nno <nowait> <Space>3 :3wincmd w<CR>
nno <nowait> <Space>4 :4wincmd w<CR>
nno <nowait> <Space>5 :5wincmd w<CR>
nno <nowait> <Space>6 :6wincmd w<CR>
nno <nowait> <Space>7 :7wincmd w<CR>
nno <nowait> <Space>8 :8wincmd w<CR>
nno <nowait> <Space>9 :9wincmd w<CR>

vno . :ruby Misc.run_repeat_on_each<CR>

ruby << RUBY
('a'..'z').each {|r| Ex.vno "@#{r} :ruby Misc.run_macro_on_each '#{r}'<CR>"}
Ex.vno "@@ :ruby Misc.run_macro_on_each '@'<CR>"
Ex.vno "<Space><Space> :ruby Misc.run_macro_on_each '@'<CR>"
RUBY

fu! LastCommandOverMotionSelection(type)
ruby MotionSelection.new(Var['a:type']).lnums.each { Ev.cursor(_1, 1); Ex.silent("normal! @:") }
endfu
nno rc :<C-u>set opfunc=LastCommandOverMotionSelection<CR>g@

fu! MacroOverMotionSelection(type)
ruby MotionSelection.new(Var['a:type']).lnums.each { Ev.cursor(_1, 1); N["@@"] }
endfu
nno r<space> :<C-u>set opfunc=MacroOverMotionSelection<CR>g@
