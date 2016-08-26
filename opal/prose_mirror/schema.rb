require "native"
require "prose_mirror/schema/mark_type"

module ProseMirror
  class Schema
    include Native

    def self.basic
      new(API.schema_basic)
    end

    def nodes
      wrap_native_hash_values(:nodes, NodeType)
    end

    def marks
      wrap_native_hash_values(:marks, MarkType)
    end

    private

    def wrap_native_hash_values(method, klass)
      hash = {}
      %x{
        var target = #{Native.call(@native, method).to_n};
        Object.keys(target).forEach(function (key) {
          #{hash[`key`] = klass.new(`target[key]`)}
        });
      }
      hash
    end
  end
end
