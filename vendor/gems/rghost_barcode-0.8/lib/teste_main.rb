require 'rubygems'

require 'rghost_barcode'


#puts RGhost::Barcode::Text.new(:size  => 10,  :font => "Courier", :offset => [0,0], :x => 0, :y => 0, :color => '#000000',  :enable => [:text, :check, :checkintext]).inspect
#puts RGhost::Barcode::Guard.new( :height => 1,   :width => 10, :left=>3, :right => 4, :left_y => 5, :right_y => 6 ).inspect
#puts RGhost::Barcode::Border.new( :width => 1, :top => 0, :right => 0, :bottom => 0, :left => 0, :color => '#000000' ).inspect

p={:text => {  :size  => 10,  :font => "Courier", :offset => [0,0], :x => 0, :y => 0, :color => '#000000',  :enable => [:text, :check, :checkintext]},
  :guard => {  :height => 1,   :width => 10, :left=>3, :right => 4, :left_y => 5, :right_y => 6 },
  :border =>{  :width => 1, :top => 0, :right => 0, :bottom => 0, :left => 0, :color => '#000000'},
  :height => 1, :width => 10,
  :color => '000000', :background => 'FFFFFF',
  :x => :limit_left, :y => :current_row,
  :inkspread => 0.5
}


#puts RGhost::Barcode::Interleaved2of5.new("KJAHDFJASHDFAKSJDFASD",p).ps

#d=RGhost::Document.new :paper => [15,8], :margin_left => 2
##d.set RGhost::Barcode::Code39.new("ASDHAJSDF", :x => 1, :y => 5, :color => 'FF0000', :border =>{:color => '00FF00'}, :text =>{:size => 10, :color => '553297' }, :height => 1,  :width => 4.545)
##d.barcode_isbn("978-1-56592-479", :x => 1, :y => 5, :color => 'FF0000', :border =>{:color => '00FF00'}, :text =>{:size => 10, :color => '553297' }, :height => 1,  :width => 4.545)
##d.barcode_isbn("978-1-56592-479", :x => 1, :y => 10, :text =>{:size => 10})
#d.define_template :barcode_template,  File.join(File.dirname(__FILE__),'ps',"barcode_template.eps")
#d.before_page_create do
#  use_template :barcode_template
#end
#@codes.each do |k,v|
#  
#  #d.rotate 90
#  d.show "Barcode Name: #{k}"
#  
#  d.jump_rows 7
#  
#  opt=v[1].merge(  :text => {:size => 10}) 
#  #d.translate :x => 2
#  d.send "barcode_#{k}".to_sym,v[0],opt.dup
#  #d.translate :x => -2
#  d.jump_rows 2
#  d.show "Code String: #{v[0]}"
#  d.next_row
#  d.show "Options: #{opt.inspect}"
#  d.next_page
#end
#text=%Q{
#<big>Barcode Writer License</big><br/>
#Anybody is free to use and develop this code as they see fit, under the terms of the permissive MIT/X-Consortium license(http://postscriptbarcode.googlecode.com/svn/trunk/LICENSE), which requires that developers attribute any derivative code to this project in both the source code and documentation. As such I take no liability for its use or misuse.<br/><br/>Thanks a lot Terry!<br/> <i>Shairon Toledo</i>
#
#}
#d.text text

f="/tmp/fonte#{rand*100}.pdf"
RGhost::Config.barcode_examples.render :pdf, :filename => "/tmp/rghost_barcode_catalog.pdf", :debug => true, :logfile => '/tmp/teste.txt'
exit
include RGhost
doc=Document.new :paper => [10.8,4], :margin => 0.3
doc.jump_rows 5
#doc.barcode_datamatrix '^142^164^186',:columns => 32,  :rows=> 32
#doc.barcode_pdf417 '^453^178^121^239', :columns => 2,  :rows=> 10
#doc.barcode_interleaved2of5 '24012345678905',:text => {:size => 10, :offset => [0,-10], :enable => [:text, :check, :checkintext] }
#doc.barcode_interleaved2of5 '24012345678905',:rotate => 90, :x => 4, 
#  :text => {
#  :size => 10,
#  :offset => [0,-10], 
#  :enable => [:text, :check, :checkintext] 
#  
#}
#doc.barcode_code39 'THIS IS CODE 39',:text => {:size => 10, :enable=>[:check] }
      
f="/local/junk/bc/f5.png"
#doc.render :png, :filename => f, :resolution => 120
=begin
    'code11' => ['0123456789',{:text => {:size => 10}}],
    'symbol' => ['fima',{:text => {:size => 10}}],
    'qrcode' => ['000100000010000000001100010101100110000110000',{:text => {:size => 10}}],
=end
#RGhost::Config::GS[:extensions] << "/tmp/foo"

#RGhost::Config.environment_fonts.render :pdf, :filename => 'mycatalog.pdf'


`evince  #{f}`










