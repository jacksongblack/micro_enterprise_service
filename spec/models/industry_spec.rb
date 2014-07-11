require 'spec_helper'
!
describe Industry do
  describe "valid name field" do
    
    it "name field must be present" do
      expect{ Industry.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
