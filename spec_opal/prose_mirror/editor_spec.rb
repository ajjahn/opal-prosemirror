require "spec_helper"

module ProseMirror
  RSpec.describe Editor do
    it "has a doc node" do
      editor = Editor.new
      expect(editor.doc).to be_a(Node)
    end

    it "has a current selection" do
      editor = Editor.new
      expect(editor.selection).to be_a(Selection)
      expect(editor.selection).to be_empty
    end
  end
end
