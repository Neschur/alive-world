module ParamsPermitter
  module World
    class Update
      MIN_STEPS_SIZE = 1
      MAX_STEPS_SIZE = 200
      DEFAULT_STEPS_SIZE = 50

      MIN_DELAY_SIZE = 0.005
      MAX_DELAY_SIZE = 1
      DEFAULT_DELAY_SIZE = 0.1

      def initialize(params)
        @params = params
      end

      def permitted_params
        {
          steps: steps,
          delay: delay,
        }
      end

      private

      attr_reader :params

      def filtred_params
        @filtred_params ||= params.permit(:steps, :delay).reject { |k, v| v.blank? }
      end

      def steps
        steps = filtred_params[:steps].to_i

        if MIN_STEPS_SIZE <= steps && steps <= MAX_STEPS_SIZE
          steps
        else
          DEFAULT_STEPS_SIZE
        end
      end

      def delay
        delay = filtred_params[:delay].to_f

        if MIN_DELAY_SIZE <= delay && delay <= MAX_DELAY_SIZE
          delay
        else
          DEFAULT_DELAY_SIZE
        end
      end
    end
  end
end
