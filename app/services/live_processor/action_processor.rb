class LiveProcessor
  class ActionProcessor
    def initialize(action)
      @action = action
    end

    def call
      action_class.new(action[:options])
    end

    def action_class
      @action_class ||= action[:action].constantize
    end
  end
end
