class HomeController < ApplicationController
  layout 'brlayout'

  #TODO passar esses caras para Brcobranca::Boleto::Base
  FORMATOS_SUPORTADOS={
    :pdf => 'application/pdf',
    :jpg => 'image/jpg',
    :tif => 'image/tiff',
    # :gif => 'image/gif',
    :png => 'image/png'
  }

  def gerar_boleto
    banco=params[:banco].to_sym

    @boleto = case banco
    when :itau then BancoItau.new
    when :bb then  BancoBrasil.new
    when :hsbc then BancoHsbc.new
    end
    #@boleto=BancoBrasil.new
    #@boleto.new Uau! isso não funciona não sei pq
    @boleto.cedente = "Kivanio Barbosa"
    @boleto.documento_cedente = "12345678912"
    @boleto.sacado = "Claudio Pozzebom"
    @boleto.sacado_documento = "12345678900"
    @boleto.valor = 11135.00
    @boleto.aceite = "S"

    case banco
    when :itau
      #     ITAU
      @boleto.agencia = "0810"
      @boleto.conta_corrente = "53678"
      @boleto.convenio = "12345"
      @boleto.numero_documento = "102008"
    when :bb
      # BB
      @boleto.agencia = "4042"
      @boleto.conta_corrente = "61900"
      @boleto.convenio = "1238798"
      @boleto.numero_documento = "7777700168"
    when :hsbc
      # HSBC
      @boleto.agencia = "4042"
      @boleto.conta_corrente = "1122334"
      @boleto.numero_documento = "12345678"
    else
      @boleto.agencia = "0810"
      @boleto.conta_corrente = "53678"
      @boleto.convenio = "12345"
      @boleto.numero_documento = "102008"
    end

    @boleto.dias_vencimento = 5
    @boleto.data_documento = "2008-02-01".to_date
    @boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento."
    @boleto.instrucao2 = "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)"
    @boleto.instrucao3 = "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006"
    @boleto.instrucao4 = "NÃO RECEBER APÓS 15/11/2006"
    @boleto.instrucao5 = "Após vencimento pagável somente nas agências do Banco do Brasil"
    @boleto.instrucao6 = "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO"
    @boleto.sacado_endereco = "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"

    # isso não funciona, coloquei um instance_eval na no contrutor Brcobranca::Boleto::Base mais acho que ele precisa passar pelos métodos
    # Podemos criar depois um Brcobranca::Boleto::Base.load que usa um hash, ou xml ou um arquivo(com parseline)
    #    @boleto.new :cedente => "Kivanio Barbosa",
    #      :documento_cedente => "12345678912",
    #      :sacado => "Claudio Pozzebom",
    #      :sacado_documento => "12345678900",
    #      :valor => 135.00,
    #      :aceite => "S",
    #      :agencia => "4042",
    #      :conta_corrente => "61900",
    #      :convenio => "1238798",
    #      :numero_documento => "7777700168",
    #      :dias_vencimento => 5,
    #      :data_documento => "2008-02-01".to_date,
    #      :instrucao1 => "Pagável na rede bancária até a data de vencimento.",
    #      :instrucao2 => "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)",
    #      :instrucao3 => "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006",
    #      :instrucao4 => "NÃO RECEBER APÓS 15/11/2006",
    #      :instrucao5 => "Após vencimento pagável somente nas agências do Banco do Brasil",
    #      :instrucao6 => "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO",
    #      :sacado_endereco => "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"

    formato=params[:boleto][:formato].to_sym
    headers['Content-Type']=FORMATOS_SUPORTADOS[formato]
    send_data @boleto.to(formato), :filename => "boleto_#{banco}.#{formato}"
  end

  def index
    @formatos=FORMATOS_SUPORTADOS.keys.map{|v| v.to_s}.sort.map{|v| [v,v]}.sort
  end

end
