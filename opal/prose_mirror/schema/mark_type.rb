require "prose_mirror/mark"

module ProseMirror
  class MarkType
    include Native

    alias_native :instance, :instance, as: Mark
    alias_native :in_set, :isInSet, as: Mark
    alias_method :in_set?, :in_set
  end
end
