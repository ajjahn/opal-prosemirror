require "prose_mirror/mark"

module ProseMirror
  class MarkType
    include Native

    alias_native :instance, as: Mark
    alias_native :in_set?, :isInSet, as: Mark
  end
end
