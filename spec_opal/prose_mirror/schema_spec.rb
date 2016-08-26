require "spec_helper"

module ProseMirror
  RSpec.describe Schema do
    let(:native) { {} }
    let(:schema) { described_class.new(native.to_n) }

    it "returns the nodes" do
      native[:nodes] = { doc: {} }
      expect(schema.nodes).to be_a(Hash)
      expect(schema.nodes[:doc]).to be_a(NodeType)
    end

    it "returns the marks" do
      native[:marks] = { em: {} }
      expect(schema.marks).to be_a(Hash)
      expect(schema.marks[:em]).to be_a(MarkType)
    end
  end
end

