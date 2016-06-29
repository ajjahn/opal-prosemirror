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
    end
  end
end
