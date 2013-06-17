class PagesController < HighVoltage::PagesController
  skip_filter :check_if_confirmed
end
