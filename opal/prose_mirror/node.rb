require "prose_mirror/value_object"
require "prose_mirror/fragment/node_methods"
require "prose_mirror/node_type"
require "prose_mirror/mark"
require "prose_mirror/slice"
require "prose_mirror/fragment"

module ProseMirror
  class Node
    include Native
    include ValueObject
    include Fragment::NodeMethods

    alias_native :type, as: NodeType
    alias_native :attributes, :attrs, as: Hash
    alias_native :content, as: Fragment
    alias_native :marks, as: Mark
    alias_native :node_size, :nodeSize
    alias_native :same_markup?, :sameMarkup
    alias_native :has_markup?, :hasMarkup
    alias_native :copy, as: Node
    alias_native :mark, as: Node
    alias_native :cut, as: Node
    alias_native :slice, as: Slice
    alias_native :replace, as: Node
    alias_native :node_at, :nodeAt, as: Node
    alias_native :resolve

    def child_after(pos)
      return unless value = Native.call(@native, :childAfter, pos)
      wrap_hash_value_with_key(Hash.new(value.to_n), :node, Node)
    end

    def child_before(pos)
      return unless value = Native.call(@native, :childBefore, pos)
      wrap_hash_value_with_key(Hash.new(value.to_n), :node, Node)
    end

    private

    def wrap_hash_value_with_key(hash, key, as)
      hash.tap do |h|
        h[key] = as.new(h[key].to_n) if h[key]
      end
    end
  end
end
