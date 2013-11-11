require 'spec_helper'

module Reports
  describe AverageSuitePrice do

    describe "average by neighboorhood" do
      context "with one province, one city and two neighboorhoods" do
        before do
          happy_province = ProvinceRepository.create!(name: 'Happy province')

          happy_place = CityRepository.create!(name: 'Happy place',
                                               province_id: happy_province.id)

          @zone_1 = NeighboorhoodRepository.create!(name: 'Zone 1', city_id: happy_place.id) 
          NeighboorhoodRepository.create!(name: 'Zone 2', city_id: happy_place.id) 
          NeighboorhoodRepository.create!(name: 'Zone 3', city_id: happy_place.id) 
        end

        context "with one suite" do
          before do
            SuiteRepository.create!(name: 'Awesome suite', price: 2000, 
                                    square_meters: 100,
                                    neighboorhood_id: @zone_1.id)
          end
          let(:expected_average_price) { 20 }

          it "should return the correct average price" do
            average_price = AverageSuitePrice.new(:neighboorhood)
            average_price.in('Zone 1').should == expected_average_price
          end
        end

        context "with two suites" do
          before do
            SuiteRepository.create!(name: 'Awesome suite', price: 5000, 
                                    square_meters: 200,
                                    neighboorhood_id: @zone_1.id)
            SuiteRepository.create!(name: 'Awesome suite', price: 2000, 
                                    square_meters: 100,
                                    neighboorhood_id: @zone_1.id)
          end
          let(:expected_average_price) { 22.5 }

          it "should return the correct average price" do
            average_price = AverageSuitePrice.new(:neighboorhood)
            average_price.in('Zone 1').should == expected_average_price
          end
        end
      end

    end

  end
end
