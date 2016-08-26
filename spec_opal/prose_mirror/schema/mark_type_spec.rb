module ProseMirror
  RSpec.describe MarkType do
    let(:native) { {} }
    let(:mark_type) { described_class.new(native.to_n) }

    # {
    #   block?: :isBlock,
    #   text_block?: :isTextblock,
    #   inline?: :isInline,
    #   text?: :isText,
    #   leaf?: :isLeaf,
    #   selectable?: :selectable,
    #   draggable?: :draggable,
    # }.each do |wrapper_method, native_method|
    #   it "delegates ##{wrapper_method} to native #{native_method} method" do
    #     native[native_method] = -> { "xyz" }
    #     expect(object.public_send(wrapper_method)).to eq("xyz")
    #   end
    # end


    it "wraps native instance object" do
      native[:instance] = { _type: "native" }

      expect(mark_type.instance).to be_a(Mark)
      expect(mark_type.instance.to_n.JS[:_type]).to eq("native")
    end

    describe "#in_set?" do
      it "passes argument to native isInSet" do
        result = "xyz"
        native[:isInSet] = -> (arg) { result = arg.first; `{}` }
        mark_type.in_set?([ Native("argument") ])

        expect(result).to eq("argument")
      end

      it "delegates to native isInSet" do
      end
    end
  end
end


