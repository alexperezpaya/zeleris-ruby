require 'spec_helper'

require 'date'

describe Zeleris do
  it 'has a version number' do
    expect(Zeleris::VERSION).not_to be nil
  end

  it 'encodes signature' do
    hash = Zeleris::Cipher.encode_signature('FLASW', 'SECRETO_COMPARTIDO', DateTime.now)
    expect(hash).to be_kind_of(String)
  end

  it 'creates order xml' do
    xml = Zeleris::Order.new({user: 'FLASW', secret: 'SECRETO_COMPARTIDO', date: DateTime.now}).build_xml
    p xml
    p Zeleris::SoapService.new.create_xml_order("<body>\n  <infocuenta>\n    <usuario>FLASW</usuario>\n    <clave>krLggYtzMV7nV+jDcRaYQf/jFblMKLg9mpDKLw1PnMQ=</clave>\n    <fecha>20161122 71000</fecha>\n  </infocuenta>\n</body>\n")
  end
end
