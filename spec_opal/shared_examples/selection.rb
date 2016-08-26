require "shared_examples/value_object"

module ProseMirror
  shared_examples_for 'selection' do
    it_behaves_like "value_object"

    let(:native) { {} }
    let(:selection) { described_class.new(native.to_n) }

    describe "wrapped methods" do
      {
        from: :from,
        to: :to,
        empty?: :empty,
      }.each do |wrapper_method, native_method|
        it "delegates ##{wrapper_method} to native #{native_method} method" do
          native[native_method] = -> { "xyz" }
          expect(selection.public_send(wrapper_method)).to eq("xyz")
        end
      end
    end

    describe "resolved position properties" do
      {
        resolved_from: :$from,
        resolved_to: :$to,
      }.each do |wrapper_method, native_method|
        it "delegates ##{wrapper_method} to native #{native_method} method" do
          native[native_method] = { _type: "native" }
          result = selection.public_send(wrapper_method)
          expect(result).to be_a(ResolvedPos)
          expect(result.to_n.JS[:_type]).to eq("native")
        end
      end
    end

    describe "#map" do
      it "returns a wrapped Selection" do
        native = `{ map: #{ -> (arg1, arg2) { `{ type: 'selection' }` } } }`
        selection = described_class.new(native).map("foo", "bar")

        expect(selection).to be_a(Selection)
        expect(`#{ selection.to_n }.type`).to eq("selection")
      end

      it "delegates to native method passing in native arguments" do
        method_stub = -> (arg1, arg2) { `{ arg1: #{arg1}, arg2: #{arg2} }` }
        native = `{ map: #{ method_stub } }`
        selection = described_class.new(native).map(`{ val: "foo" }`,
                                                    `{ val: "bar" }`)

        expect(`#{ selection.to_n }.arg1.val`).to eq("foo")
        expect(`#{ selection.to_n }.arg2.val`).to eq("bar")
      end

      it "unwraps non-native arguments"do
        method_stub = -> (arg1, arg2) { `{ arg1: #{arg1}, arg2: #{arg2} }` }
        native = `{ map: #{ method_stub } }`
        selection = described_class.new(native).map(Native(`{ val: "foo" }`),
                                                    Native(`{ val: "bar" }`))

        expect(`#{ selection.to_n }.arg1.val`).to eq("foo")
        expect(`#{ selection.to_n }.arg2.val`).to eq("bar")
      end
    end

    it 'unwraps native selection' do
      native = `{}`
      selection = described_class.new(native)

      expect(`#{selection.to_n} === #{native}`).to be_truthy
    end
  end
end

