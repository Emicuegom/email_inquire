# frozen_string_literal: true

require "spec_helper"

RSpec.describe EmailInquire::Validator::CommonlyMistakenDomain do
  describe ".validate" do
    it "returns nil for an unrelated address" do
      expect(described_class.validate("john@domain.xyz")).to eq(nil)
    end

    it "returns a valid response for a listed address" do
      expect(described_class.validate("john@gmail.com")).to be_a(EmailInquire::Response)
        .and be_valid
    end

    described_class::MISTAKES.each do |key, value|
      context 'mistakes' do
        let!(:key_to_s) { key.to_s.gsub('(?-mix:','').gsub('\\','').gsub(')','') }

        it "returns an hint (#{value}) response for a matching address with (#{key})" do
          expect(described_class.validate("john@#{key_to_s}")).to be_a(EmailInquire::Response)
          .and be_hint
          .and have_attributes(replacement: "john@#{value}")
        end
      end
    end
  end
end
