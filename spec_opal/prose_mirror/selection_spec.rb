require "spec_helper"

module ProseMirror
  RSpec.describe Selection do
    def stub_native(native, method, value)
      `#{ native }[#{ method }] = #{ -> { value } }`
      native
    end

    describe ".new" do
      it "returns the NodeSelection for native NodeSelection types" do
        pos = stub_native(`{ nodeAfter: {} }`, :plusOne, `{}`)
        native = `new proseMirror.edit.NodeSelection(#{ pos })`
        selection = described_class.new(native)

        expect(selection).to be_a(NodeSelection)
      end

      it "returns the TextSelection for native TextSelection types" do
        anchor = `{ pos: 0 }`
        native = `new proseMirror.edit.TextSelection(#{ anchor })`
        selection = described_class.new(native)

        expect(selection).to be_a(TextSelection)
      end

      it "takes a native selection" do
        native = `{}`
        selection = described_class.new(native)

        expect(`#{selection.to_n} === #{native}`).to be_truthy
      end
    end
  end
end
