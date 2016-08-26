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

    describe "methods" do
      it " getOption(name: string) → any "
      it " setTextSelection(anchor: number, head: ?number = anchor) "
      it " setNodeSelection(pos: number) "
      it " setSelection(selection: Selection) "
      it " setDoc(doc: Node, sel: ?Selection) "
      it " apply(transform: Transform, options: ?Object = nullOptions) → Transform "
      it " scrollIntoView: ?bool "
      it " selection: ?Selection "
      it " filter: ?bool "
      it " flush() → bool "
      it " addKeymap(map: Keymap, priority: ?number = 0) "
      it " removeKeymap(map: union<string, Keymap>) "
      it " markRange(from: number, to: number, options: ?Object) → MarkedRange "
      it " inclusiveLeft: bool = false "
      it " inclusiveRight: bool = false "
      it " removeWhenEmpty: bool = true "
      it " className: string "
      it " onRemove: fn(number, number) "
      it " removeRange(range: MarkedRange) "
      it " activeMarks() → [Mark] "
      it " addActiveMark(mark: Mark) "
      it " removeActiveMark(markType: MarkType) "
      it " focus() "
      it " hasFocus() → bool "
      it " posAtCoords(coords: {top: number, left: number}) → ?number "
      " contextAtCoords(coords: {top: number, left: number}) → ?{pos: number, inside:
it [{pos: number, node: Node}]} "
      it " coordsAtPos(pos: number) → {top: number, left: number, bottom: number} "
      it " scrollIntoView(pos: ?number = null) "
      it " translate(string: string) → string "
      it " scheduleDOMUpdate(f: fn() → ?fn() → ?fn()) "
      it " unscheduleDOMUpdate(f: fn() → ?fn() → ?fn()) "
      it " updateScheduler(subscriptions: [Subscription], start: fn() → ?fn()) → UpdateScheduler "
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
