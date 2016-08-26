module ProseMirror
  class Node; end

  class Fragment
    module NodeMethods
      def self.included(base)
        base.alias_native :child_count, :childCount
        base.alias_native :child, :child, as: Node
        base.alias_native :child!, :maybeChild, as: Node
        base.alias_native :first_child, :firstChild, as: Node
        base.alias_native :last_child, :lastChild, as: Node
        base.alias_native :text, :textContent
        base.alias_native :text_between, :textBetween
      end
    end
  end
end

