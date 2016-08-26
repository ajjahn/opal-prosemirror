require "prose_mirror/node"

module ProseMirror
  class ResolvedPos
    include Native

    alias_native :pos
    alias_native :path
    alias_native :depth
    alias_native :parent_offset, :parentOffset
    alias_native :resolve_depth, :resolveDepth
    alias_native :parent, as: Node
    alias_native :node, as: Node
    alias_native :index
    alias_native :index_after, :indexAfter
    alias_native :start
    alias_native :end
    alias_native :before
    alias_native :after
    alias_native :at_node_boundary?, :atNodeBoundary
    alias_native :node_before, :nodeBefore, as: Node
    alias_native :node_after, :nodeAfter, as: Node
  end
end
