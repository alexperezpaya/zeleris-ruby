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
end
