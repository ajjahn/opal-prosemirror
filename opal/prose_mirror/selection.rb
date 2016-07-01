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
    alias_native :empty?, :empty
  end

  class NodeSelection < Selection
  end

  class TextSelection < Selection
  end
end
