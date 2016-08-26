require "spec_helper"

module ProseMirror
  RSpec.describe Editor do
    it "wraps native schema object" do
      native = `{ schema: { type: "native" } }`
      editor = Editor.new(native)

      expect(editor.schema).to be_a(Schema)
      expect(editor.schema.to_n.JS[:type]).to eq("native")
    end

    it "wraps native selection object" do
      native = `{ selection: { type: "native" } }`
      editor = Editor.new(native)

      expect(editor.selection).to be_a(Selection)
      expect(editor.selection.to_n.JS[:type]).to eq("native")
    end

    it "wraps native doc node object" do
      native = `{ doc: { type: "native" } }`
      editor = Editor.new(native)

      expect(editor.doc).to be_a(Node)
      expect(editor.doc.to_n.JS[:type]).to eq("native")
    end

    it "wraps native history object" do
      native = `{ history: { type: "native" } }`
      editor = Editor.new(native)

      expect(editor.history).to be_a(History)
      expect(editor.history.to_n.JS[:type]).to eq("native")
    end

    it "wraps native transform object" do
      native = `{ tr: { type: "native" } }`
      editor = Editor.new(native)

      expect(editor.transform).to be_a(Transform)
      expect(editor.transform.to_n.JS[:type]).to eq("native")
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

    def stub_native(native, method, value)
      `#{ native }[#{ method }] = #{ -> { value } }`
      native
    end

    describe "#active_marks" do
      it "returns a list of marks" do
      native = stub_native(`{}`, :activeMarks, `[ { type: "native" } ]` )
      editor = Editor.new(native)

      expect(editor.active_marks.first).to be_a(Mark)
      expect(editor.active_marks.first.to_n.JS[:type]).to eq("native")
      end
    end
  end
end
