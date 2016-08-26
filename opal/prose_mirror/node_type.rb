module ProseMirror
  class NodeType
    include Native

    alias_native :block?, :isBlock
    alias_native :text_block?, :isTextblock
    alias_native :inline?, :isInline
    alias_native :text?, :isText
    alias_native :leaf?, :isLeaf
    alias_native :selectable?, :selectable
    alias_native :draggable?, :draggable
  end
end
