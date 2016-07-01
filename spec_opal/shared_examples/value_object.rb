shared_examples_for "value_object" do
  let(:native) { {} }
  let(:object) { described_class.new(native.to_n) }

  describe "#== (equality methods)" do
    it "passes unwrapped argument to native eq(node)" do
      result = "xyz"
      wrapped = Native(`{ foo: "bar" }`)
      native[:eq] = -> (arg) { result = arg; "returned" }

      expect(object == wrapped).to eq("returned")
      expect(`#{result} === #{wrapped.to_n}`).to be_truthy
    end
  end
end
