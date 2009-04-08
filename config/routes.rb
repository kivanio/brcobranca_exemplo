ActionController::Routing::Routes.draw do |map|
  map.connect '/home/gerar_boleto/:banco', :controller => 'home', :action => 'gerar_boleto'
  map.root :controller => "home"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
