require 'savon'

module Zeleris
  class SoapService
    def initialize(production: false)
      base_url = production ? 'http://arilp.zeleris.com:8080' : 'http://arilp.zeleris.com'
      @url = "#{base_url}/ArilServicioWeb/services/"
    end

    def create_xml_order(xml)
      c = client_for('EnvioPedido')
      c.call(:order_pedido_xml, xml: xml).body
    end

    private

    def client_for(service)
      Savon.client(wsdl: "#{@url}#{service}?wsdl")
    end
  end
end
