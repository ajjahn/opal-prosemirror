module ProseMirror
  class Schema
    def initialize(native)
      @native = `proseMirror.schemaBasic.schema`
    end

    def to_n
      @native
    end
  end
end
