require 'spec_helper'

describe Domain do
  describe "valid name field" do
    
    it "name field must be present" do
      expect{ Domain.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
