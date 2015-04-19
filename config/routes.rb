Rails.application.routes.draw do
  root 'home#index'
  post '/home/gerar_boleto/:banco' =>'home#gerar_boleto'
  get '/home/boleto_hash' =>'home#boleto_hash'
  get '/home/multi_boleto' =>'home#multi_boleto'
end
