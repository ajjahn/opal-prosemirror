require "spec_helper"

module ProseMirror
  RSpec.describe Fragment do
    it_behaves_like "value_object"
    it_behaves_like "node_or_fragment"
  end
end
