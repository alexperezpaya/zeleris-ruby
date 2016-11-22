module Zeleris
  class Order
    attr_accessor :user, :secret, :date
    def initialize(hash)
      hash.each do |k, v|
        send("#{k}=", v)
      end
    end

    def build_xml
      Nokogiri::XML::Builder.new(encoding: 'UTF-8') do
        body do
          infocuenta do
            usuario user
            clave Cipher.encode_signature(user, secret, date)
            fecha date.strftime(DATE_FORMAT)
          end
        end
      end.to_xml
    end
  end
end
