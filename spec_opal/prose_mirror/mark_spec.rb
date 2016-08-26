module ProseMirror
  RSpec.describe Mark do
    let(:native) { {} }
    let(:object) { described_class.new(native.to_n) }

    describe "#in_set?" do
      it "passes argument to native isInSet" do
        result = "xyz"
        native[:isInSet] = -> (arg) { result = arg.first; `{}` }
        object.in_set?([ Native("argument") ])

        expect(result).to eq("argument")
      end

      it "delegates to native isInSet" do
      end
    end
  end
end
