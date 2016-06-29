require "prose_mirror/selection"
require "prose_mirror/schema"
require "prose_mirror/node"
require "prose_mirror/history"
require "prose_mirror/transform"

module ProseMirror
  class Editor
    include Native

    def schema
      Schema.new(`#@native.schema`)
    end

    def selection
      Selection.new(`#@native.selection`)
    end

    def doc
      Node.new(`#@native.doc`)
    end

    def history
      History.new(`#@native.history`)
    end

    def transform
      Transform.new(`#@native.tr`)
    end
  end
end
