# frozen_string_literal: true

RSpec.describe Toktokkie do
  it "has a version number" do
    expect(Toktokkie::VERSION).not_to be nil
  end

  describe ".configure" do
    after(:each) { Toktokkie.reset_configuration }

    context "setting the key" do
      it "sets a readable value for the key" do
        key_value = "I'm a key"
        Toktokkie.configure do |config|
          config.key = key_value
        end
        expect(Toktokkie.configuration.key).to eq(key_value)
      end
    end

    context "setting the secret" do
      it "sets a readable value for the secret" do
        secret_value = "No guessing!"
        Toktokkie.configure do |config|
          config.secret = secret_value
        end
        expect(Toktokkie.configuration.secret).to eq(secret_value)
      end
    end
  end

  describe ".client" do
    subject(:client) { described_class.client }

    context "with no configuration" do
      it "raises an ConfigurationError exception" do
        expect{ client }.to raise_error(Toktokkie::ConfigurationError)
      end
    end

    context "with valid configuration" do
      before(:each) do
        Toktokkie.configure do |config|
          config.key = "something"
          config.secret = "another"
        end
      end

      after(:each) { Toktokkie.reset_configuration }

      it "does not raise any exceptions" do
        p Toktokkie.configuration
        expect{ client }.to_not raise_error
      end
    end
  end
end
