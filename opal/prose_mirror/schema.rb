require "native"
require "prose_mirror/api"

module ProseMirror
  class Schema
    include Native

    def self.basic
      new(API.schema_basic)
    end
  end
end
