require "prose_mirror/selection"
require "prose_mirror/schema"
require "prose_mirror/node"

module ProseMirror
  class Editor
    def initialize
      # hash = { schema: `proseMirror.schemaBasic.schema` }.to_n
      # schema = `proseMirror.schemaBasic.schema`
      schema = Schema.new
      @native = `new proseMirror.edit.ProseMirror({ schema: #{schema.to_n} })`
    end

    def doc
      Node.new(`#@native.doc`)
    end

    def selection
      Selection.new(`#@native.selection`)
    end
  end
end
