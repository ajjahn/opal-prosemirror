require "spec_helper"

module ProseMirror
  RSpec.describe ResolvedPos do
    let(:native) { {} }
    let(:resolved_pos) { described_class.new(native.to_n) }

    describe "node getter methods" do
      {
        parent: :parent,
        node: :node,
        node_before: :nodeBefore,
        node_after: :nodeAfter,
      }.each do |wrapper_method, native_method|
        describe "##{wrapper_method}" do
          it "delegates to native #{native_method} method" do
            native[native_method] = { _type: "native" }
            result = resolved_pos.public_send(wrapper_method)
            expect(result).to be_a(Node)
            expect(result.to_n.JS[:_type]).to eq("native")
          end

          it "passes native args to native #{native_method}" do
            result = "nothing"
            native[native_method] = -> (arg) { result = arg; `{}` }
            resolved_pos.public_send(wrapper_method, "value")
            expect(result).to eq("value")
          end

          it "returns nil when native #{native_method} returns null" do
            native[native_method] = -> (arg) { `null` }

            result = resolved_pos.public_send(wrapper_method)
            expect(result).to be_nil
          end
        end
      end
    end

    describe "properties" do
      {
        pos: :pos,
        path: :path,
        depth: :depth,
        parent_offset: :parentOffset,
      }.each do |wrapper_method, native_method|
        describe "##{wrapper_method}" do
          it "delegates to native #{native_method} method" do
            native[native_method] = -> { "xyz" }
            expect(resolved_pos.public_send(wrapper_method)).to eq("xyz")
          end
        end
      end
    end

    describe "getter methods" do
      {
        resolve_depth: :resolveDepth,
        index: :index,
        index_after: :indexAfter,
        start: :start,
        end: :end,
        before: :before,
        after: :after,
        at_node_boundary?: :atNodeBoundary,
      }.each do |wrapper_method, native_method|
        describe "##{wrapper_method}" do
          it "delegates to native #{native_method} method" do
            native[native_method] = -> { "xyz" }
            expect(resolved_pos.public_send(wrapper_method)).to eq("xyz")
          end

          it "passes native args to native #{native_method}" do
            result = "nothing"
            native[native_method] = -> (arg) { result = arg; `{}` }
            resolved_pos.public_send(wrapper_method, "value")
            expect(result).to eq("value")
          end
        end
      end
    end
  end
end

