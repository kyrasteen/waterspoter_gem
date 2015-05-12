require './test/test_helper'

class WaterspoterGaugeTest < Minitest::Test
  def test_exists
    assert Waterspoter::Gauge
  end

  def test_it_gives_back_co_gauges
    VCR.use_cassette('co_gauges') do
      gauges = Waterspoter::Gauge.find_by_state("co")
      assert_equal Waterspoter::Gauge, gauges.class
    end
  end
end
