require "prose_mirror/node"
require "prose_mirror/resolved_pos"

module ProseMirror
  class Selection
    include Native

    def self.new(native)
      return super unless self == Selection
      if Native.is_a?(native, API.node_selection)
        return NodeSelection.new(native)
      elsif Native.is_a?(native, API.text_selection)
        return TextSelection.new(native)
      end
      super
    end

    alias_native :from
    alias_native :to
    alias_native :resolved_from, :$from, as: ResolvedPos
    alias_native :resolved_to, :$to, as: ResolvedPos
    alias_native :empty?, :empty
    alias_native :==, :eq

    def map(*args)
      Selection.new(`#@native.map.apply(this, #{Native(args).to_n})`)
    end
  end

  class NodeSelection < Selection
    alias_native :node, :node, as: Node
  end

  class TextSelection < Selection
    alias_native :inverted?, :inverted
  end
end
