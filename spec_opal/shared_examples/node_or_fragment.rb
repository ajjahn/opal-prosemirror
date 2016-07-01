module ProseMirror
  shared_examples_for "node_or_fragment" do
    let(:native) { {} }
    let(:object) { described_class.new(native.to_n) }

    it "delegates to native childCount property" do
      native[:childCount] = 4
      expect(object.child_count).to eq(4)
    end

    describe "#child" do
      it "passes argument to native child(index)" do
        result = "xyz"
        native[:child] = -> (arg) { result = arg; `{}` }
        object.child("argument")

        expect(result).to eq("argument")
      end

      it "wraps native returned node object" do
        native[:child] = -> (arg) { { type: "native" } }

        expect(object.child(4)).to be_a(Node)
        expect(object.child(4).to_n.JS[:type]).to eq("native")
      end
    end

    describe "#child!" do
      it "passes argument to native maybeChild(index)" do
        result = "xyz"
        native[:maybeChild] = -> (arg) { result = arg; `{}` }
        object.child!("argument")

        expect(result).to eq("argument")
      end

      it "wraps native returned node object" do
        native[:maybeChild] = -> (arg) { { type: "native" } }

        expect(object.child!(4)).to be_a(Node)
        expect(object.child!(4).to_n.JS[:type]).to eq("native")
      end

      it "returns nil when child does not exist" do
        native[:maybeChild] = -> (arg) { `undefined` }
        expect(object.child!(4)).to be_nil
      end
    end

    it "delegates to native forEach"

    it "delegates to native textContent" do
      native[:textContent] = "text"
      expect(object.text).to eq("text")
    end

    it "delegates to native textBetween" do
      native[:textBetween] = -> (arg1, arg2, arg3) { [arg1, arg2, arg3] }
      expect(object.text_between(0, 2, "-")).to eq([0, 2, "-"])
    end

    describe "#first_child" do
      it "wraps native returned node object" do
        native[:firstChild] = { type: "native" }

        expect(object.first_child).to be_a(Node)
        expect(object.first_child.to_n.JS[:type]).to eq("native")
      end

      it "returns nil when child does not exist" do
        native[:firstChild] = `null`
        expect(object.first_child).to be_nil
      end
    end

    describe "#last_child" do
      it "wraps native returned node object" do
        native[:lastChild] = { type: "native" }

        expect(object.last_child).to be_a(Node)
        expect(object.last_child.to_n.JS[:type]).to eq("native")
      end

      it "returns nil when child does not exist" do
        native[:lastChild] = `null`
        expect(object.last_child).to be_nil
      end
    end
  end
end
