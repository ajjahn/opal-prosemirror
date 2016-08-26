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

    describe "#mark" do
      it "passes unwrapped marks array argument to native" do
        unwrapped = "nonsense"
        wrapped = [ Native(`{ foo: "bar" }`) ]

        native[:mark] = -> (marks) { unwrapped = marks; `{}` }

        node.mark(wrapped)
        expect(`#{unwrapped}[0] === #{wrapped.first.to_n}`).to be_truthy
      end

      it "wraps returned native node object" do
        native[:mark] = { _type: "native" }

        expect(node.mark).to be_a(Node)
        expect(node.mark.to_n.JS[:_type]).to eq("native")
      end
    end

    describe "#cut" do
      it "wraps returned native node object" do
        native[:cut] = -> (from, to) { { _type: "native" } }

        expect(node.cut(1)).to be_a(Node)
        expect(node.cut(1,2).to_n.JS[:_type]).to eq("native")
      end
    end

    describe "#slice" do
      it "wraps returned native slice object" do
        native[:slice] = -> (from, to) { { _type: "native" } }

        expect(node.slice(1)).to be_a(Slice)
        expect(node.slice(1,2).to_n.JS[:_type]).to eq("native")
      end
    end

    describe "#replace" do
      it "passes unwrapped slice argument to native" do
        unwrapped = "nonsense"
        wrapped =  Native(`{ foo: "bar" }`)

        native[:replace] = -> (from, to, slice) { unwrapped = slice; `{}` }

        node.replace(:_, :_, wrapped)
        expect(`#{unwrapped} === #{wrapped.to_n}`).to be_truthy
      end

      it "wraps returned native slice object" do
        native[:replace] = -> (from, to, slice) { { _type: "native" } }

        expect(node.replace(1,2, `{}`)).to be_a(Node)
        expect(node.replace(1,2).to_n.JS[:_type]).to eq("native")
      end
    end

    describe "#node_at" do
      it "wraps returned native node object" do
        native[:nodeAt] = -> (pos) { { _type: "native" } }

        expect(node.node_at(1)).to be_a(Node)
        expect(node.node_at(1).to_n.JS[:_type]).to eq("native")
      end
    end

    describe "#child_after" do
      it "wraps returned native hash object" do
        native[:childAfter] = -> (pos) { { _type: "native" } }

        expect(node.child_after(1)).to be_a(Hash)
        expect(node.child_after(1).to_n.JS[:_type]).to eq("native")
      end

      it "wraps the native node in the hash" do
        native[:childAfter] = -> (pos) { { node: `{}` } }

        expect(node.child_after(1)[:node]).to be_a(Node)
      end
    end

    describe "#child_before" do
      it "wraps returned native hash object" do
        native[:childBefore] = -> (pos) { { _type: "native" } }

        expect(node.child_before(1)).to be_a(Hash)
        expect(node.child_before(1).to_n.JS[:_type]).to eq("native")
      end

      it "wraps the native node in the hash" do
        native[:childBefore] = -> (pos) { { node: `{}` } }

        expect(node.child_before(1)[:node]).to be_a(Node)
      end
    end

    it "nodesBetween"
    it "descendants"

    describe "#resolve" do
      # it "wraps returned native ResolvedPos object" do
      #   native[:resolve] = -> (pos) { { _type: "native" } }

      #   expect(node.resolve(1)).to be_a(ResolvedPos)
      #   expect(node.resolve(1).to_n.JS[:_type]).to eq("native")
      # end
    end
  end
end

