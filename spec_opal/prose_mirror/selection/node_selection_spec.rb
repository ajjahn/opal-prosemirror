require "spec_helper"

module ProseMirror
  RSpec.describe NodeSelection do
    it_behaves_like "selection"

    let(:native) { {} }
    let(:selection) { described_class.new(native.to_n) }

    describe "#node" do
      it "returns a Node" do
        native[:node] = { _type: "native" }
        expect(selection.node).to be_a(Node)
        expect(selection.node.to_n.JS[:_type]).to eq("native")
      end
    end
  end
end

