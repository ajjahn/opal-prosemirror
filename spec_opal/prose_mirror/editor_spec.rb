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

    describe "options" do
      it " schema: Schema "
      it " doc: Node "
      it " place: ?union<DOMNode, fn(DOMNode)> "
      it " historyDepth: number "
      it " historyEventDelay: number "
      it " scrollThreshold: number "
      it " scrollMargin: number "
      it " keymap: Keymap "
      it " label: ?string "
      it " translate(string) → string "
      it " plugins: [Plugin] "
    end
  end
end
