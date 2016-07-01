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
  end
end
