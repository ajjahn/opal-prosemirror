require "spec_helper"

module ProseMirror
  RSpec.describe Node do
    it_behaves_like "value_object"
    it_behaves_like "node_or_fragment"

    let(:native) { {} }
    let(:node) { described_class.new(native.to_n) }

    it "wraps native node_type object" do
      native[:type] = { _type: "native" }

      expect(node.type).to be_a(NodeType)
      expect(node.type.to_n.JS[:_type]).to eq("native")
    end

    it "wraps native attrs object to a hash" do
      native[:attrs] = { key: "value" }

      expect(node.attributes).to be_a(Hash)
      expect(node.attributes.to_n.JS[:key]).to eq("value")
    end

    it "wraps native content fragment object" do
      native[:content] = { type: "native" }

      expect(node.content).to be_a(Fragment)
      expect(node.content.to_n.JS[:type]).to eq("native")
    end

    it "wraps native marks fragment object" do
      native[:marks] = { type: "native" }

      expect(node.marks).to be_a(Mark)
      expect(node.marks.to_n.JS[:type]).to eq("native")
    end

    it "delegates to native nodeSize property" do
      native[:nodeSize] = 3
      expect(node.node_size).to eq(3)
    end

    it "passes unwrapped argument to native sameMarkup(node)" do
      result = false
      wrapped = Native(`{ foo: "bar" }`)

      native[:sameMarkup] = -> (arg) { result = arg; true }

      node.same_markup?(wrapped)
      expect(`#{result} === #{wrapped.to_n}`).to be_truthy
    end

    describe "#has_markup?" do
      it "passes unwrapped Array[Mark] argument to native" do
        unwrapped = "nonsense"
        wrapped = [ Native(`{ foo: "bar" }`) ]

        native[:hasMarkup] = -> (type, attrs, marks) { unwrapped = marks; true }

        node.has_markup?(:_, :_, wrapped)
        expect(`#{unwrapped}[0] === #{wrapped.first.to_n}`).to be_truthy
      end

      it "passes unwrapped NodeType argument to native" do
        unwrapped = "nonsense"
        wrapped = Native(`{ foo: "bar" }`)

        native[:hasMarkup] = -> (type, attrs, marks) { unwrapped = type; true }

        node.has_markup?(wrapped)
        expect(`#{unwrapped} === #{wrapped.to_n}`).to be_truthy
      end
    end

    describe "#copy" do
      it "passes unwrapped Fragment argument to native" do
        unwrapped = "nonsense"
        wrapped = Native(`{ foo: "bar" }`)

        native[:copy] = -> (fragment) { unwrapped = fragment; `{}` }

        node.copy(wrapped)
        expect(`#{unwrapped} === #{wrapped.to_n}`).to be_truthy
      end

      it "wraps returned native node object" do
        native[:copy] = { _type: "native" }

        expect(node.copy).to be_a(Node)
        expect(node.copy.to_n.JS[:_type]).to eq("native")
      end
    end
  end
end

