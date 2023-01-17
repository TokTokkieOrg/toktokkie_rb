# frozen_string_literal: true

RSpec.describe Toktokkie::Configuration do
  describe "usable?" do
    let(:configuration) { described_class.new }
    subject(:is_usable) { configuration.usable? }

    before(:each) do
      configuration.key = key
      configuration.secret = secret
    end

    context "given a key and secret" do
      let(:key) { "key" }
      let(:secret) { "secret" }

      it { is_expected.to be(true) }
    end

    context "given a key and no secret" do
      let(:key) { "key" }
      let(:secret) { nil }

      it { is_expected.to be(false) }
    end

    context "given a no key and a secret" do
      let(:key) { nil }
      let(:secret) { "secret" }

      it { is_expected.to be(false) }
    end

    context "given neither a key or secret" do
      let(:key) { nil }
      let(:secret) { nil }

      it { is_expected.to be(false) }
    end
  end
end
