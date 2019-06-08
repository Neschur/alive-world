module ParamsPermitter
  module World
    class Create
      MIN_WORLD_SIZE = 1
      MAX_WORLD_SIZE = 50
      DEFAULT_WORLD_SIZE = 20

      def initialize(params)
        @params = params
      end

      def permitted_params
        {
          xx: some_size(:xx),
          yy: some_size(:yy),
        }
      end

      private

      attr_reader :params

      def filtred_params
        @filtred_params ||= params.permit(:xx, :yy).reject { |k, v| v.blank? }
      end

      def xx
        some_size(:xx)
      end

      def some_size(type)
        size = filtred_params[type].to_i
        if size >= MIN_WORLD_SIZE || size <= MAX_WORLD_SIZE
          size
        else
          DEFAULT_WORLD_SIZE
        end
      end
    end
  end
end
