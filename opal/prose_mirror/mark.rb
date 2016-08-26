module ProseMirror
  class Mark
    include Native

    alias_native :in_set?, :isInSet
  end
end
