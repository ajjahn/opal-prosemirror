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
  end
end
