module ProseMirror
  module API
    NAMESPACE = `proseMirror`

    def self.editor
      `#{module_for(:edit)}.proseMirror`
    end

    def self.schema_basic
      `#{module_for(:schemaBasic)}.schema`
    end

    def self.node_selection
      `#{module_for(:edit)}.NodeSelection`
    end

    def self.text_selection
      `#{module_for(:edit)}.TextSelection`
    end

    def self.module_for(name)
      `#{NAMESPACE}[#{name}]`
    end
  end
end
