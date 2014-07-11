module IndustriesHelper

  def industries
    @industries ||= Industry.all
  end
end
