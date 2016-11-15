require 'spec_helper'

RSpec.describe "using the should syntax" do
  specify { 3.should eq(3) }
  specify { 3.should_not eq(4) }
  specify { lambda { raise "boom" }.should raise_error("boom") }
  specify { lambda { }.should_not raise_error }
end

RSpec.describe "using the expect syntax" do
  specify { expect(3).to eq(3) }
  specify { expect(3).not_to eq(4) }
  specify { expect { raise "boom" }.to raise_error("boom") }
  specify { expect { }.not_to raise_error }
end