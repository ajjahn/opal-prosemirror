require "native"
require "prose_mirror/schema"
require "prose_mirror/selection"
require "prose_mirror/value_object"
require "prose_mirror/fragment"
require "prose_mirror/mark"
require "prose_mirror/node_type"
require "prose_mirror/node"
require "prose_mirror/history"
require "prose_mirror/transform"

module ProseMirror
  class Editor
    include Native

    alias_native :schema, :schema, as: Schema
    alias_native :selection, :selection, as: Selection
    alias_native :doc, :doc, as: Node
    alias_native :history, :history, as: History
    alias_native :transform, :tr, as: Transform
    alias_native :wrapper

    def active_marks
      `#@native.activeMarks()`.map { |mark| Mark.new(mark) }
    end
  end
end
