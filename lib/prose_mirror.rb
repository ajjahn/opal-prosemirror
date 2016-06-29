require "opal"
require "prose_mirror/version"

module ProseMirror
end

Opal.append_path(File.expand_path(File.join("..", "..", "opal"),
                                  __FILE__).untaint)
