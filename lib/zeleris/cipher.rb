require 'digest'

module Zeleris
  module Cipher
    DATE_FORMAT = '%Y%m%d%l%M%S'

    extend self

    def encode_signature(user, secret, datetime)
      signature_hash(signature_base(user, secret, datetime))
    end

    private

    def signature_base(user, secret, datetime)
      user + secret + datetime.strftime(DATE_FORMAT).reverse
    end

    def signature_hash(base)
      Digest::SHA256.base64digest(Digest::SHA256.base64digest(base))
    end
  end
end
