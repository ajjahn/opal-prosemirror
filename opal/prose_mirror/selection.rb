require "native"

module ProseMirror
  class Selection
    include Native

    alias_native :from
    alias_native :to
    alias_native :empty?, :empty
  end
end
