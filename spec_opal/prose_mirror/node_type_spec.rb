module ProseMirror
  RSpec.describe NodeType do
    let(:native) { {} }
    let(:object) { described_class.new(native.to_n) }

    {
      block?: :isBlock,
      text_block?: :isTextblock,
      inline?: :isInline,
      text?: :isText,
      leaf?: :isLeaf,
      selectable?: :selectable,
      draggable?: :draggable,
    }.each do |wrapper_method, native_method|
      it "delegates ##{wrapper_method} to native #{native_method} method" do
        native[native_method] = -> { "xyz" }
        expect(object.public_send(wrapper_method)).to eq("xyz")
      end
    end
  end
end

