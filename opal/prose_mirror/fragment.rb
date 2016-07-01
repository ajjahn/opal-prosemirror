require "prose_mirror/fragment/node_methods"

module ProseMirror
  class Fragment
    include Native
    include ValueObject
    include NodeMethods
  end
end
