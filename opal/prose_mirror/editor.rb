require "prose_mirror/selection"
require "prose_mirror/schema"
require "prose_mirror/node"

module ProseMirror
  class Editor
    include Native

    def schema
      Schema.new(`#@native.schema`)
    end

    def doc
      Node.new(`#@native.doc`)
    end

    def selection
      Selection.new(`#@native.selection`)
    end
  end
end
