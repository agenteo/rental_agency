module Reports
  module Query

    class NeighboorhoodAveragePrice
      attr_reader :neighboorhood_name
      
      def initialize(neighboorhood_name)
        @neighboorhood_name = neighboorhood_name
      end

      def value
        total_price = prices_per_square_meter.inject do |sum, partial_price|
          sum + partial_price
        end
        total_price.to_f / prices_per_square_meter.size
      end

      private

        def prices_per_square_meter
          @prices_per_square_meter ||= SuiteRepository.joins(:neighboorhood_repository)
          .where(["neighboorhood_repositories.name = ?", neighboorhood_name])
          .pluck("price / square_meters AS price_per_square_meter")
        end

    end

  end
end
