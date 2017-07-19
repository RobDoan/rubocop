module Rubocop
  module Cop
    class TryMethod < RuboCop::Cop::Cop
      MSG = 'prefer using `&.` than `.try`'
      def_node_matcher :trying?, '(send _ :try ...)'

      def on_send(node)
        return unless trying?(node)
        add_offense(node, :selector)
      end
    end
  end
end