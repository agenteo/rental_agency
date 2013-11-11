module Reports
  class AverageSuitePrice

    def initialize(filter_method)
      @filter_method = filter_method
    end

    def in(filter_text)
      case @filter_method
        when :neighboorhood
          average_price = Query::NeighboorhoodAveragePrice.new(filter_text)
          return average_price.value
      end
    end

  end
end
