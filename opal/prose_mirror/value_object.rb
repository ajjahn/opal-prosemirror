module ProseMirror
  module ValueObject
    def self.included(base)
      base.alias_native :==, :eq
    end
  end
end
