require "prose_mirror/api"
require "prose_mirror/editor"

module ProseMirror
  def self.new(options = {})
    options = { schema: Schema.basic }.merge(options)

    native = `new proseMirror.edit.ProseMirror(#{options.to_n})`
    Editor.new(native)
  end
end
