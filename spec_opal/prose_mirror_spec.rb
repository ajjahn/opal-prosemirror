require "spec_helper"

RSpec.describe ProseMirror do
  describe "#create_editor" do
    it "returns an editor" do
      editor = described_class.new
      expect(editor).to be_a(ProseMirror::Editor)
    end

    it "places the editor in the given dom node" do
      element = $document.create_element('div')
      editor = ProseMirror.new(place: element)

      expect(element.child).to be_elem
      expect(element.child.class_names).to include("ProseMirror")
    end

    it "sets the editor's schema as an option" do
      schema = ProseMirror::Schema.basic
      editor = ProseMirror.new(schema: schema)

      expect(`#{editor.schema.to_n} === #{schema.to_n}`).to be_truthy
    end
  end
end

