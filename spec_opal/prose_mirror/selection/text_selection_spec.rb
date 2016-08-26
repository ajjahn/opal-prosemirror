require "spec_helper"

module ProseMirror
  RSpec.describe TextSelection do
    it_behaves_like "selection"

    let(:native) { {} }
    let(:selection) { described_class.new(native.to_n) }

    describe "wrapped methods" do
      {
        inverted?: :inverted,
      }.each do |wrapper_method, native_method|
        it "delegates ##{wrapper_method} to native #{native_method} method" do
          native[native_method] = -> { "xyz" }
          expect(selection.public_send(wrapper_method)).to eq("xyz")
        end
      end
    end
  end
end
