module Differ
  module Format
    module HTML
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end

      private
        def as_insert(change)
          change.insert.lines.map{|l| %Q{<ins class="differ">+ #{l}</ins>}}.join
        end

        def as_delete(change)
          change.delete.lines.map{|l| %Q{<del class="differ">- #{l}</del>}}.join
        end

        def as_change(change)
          as_delete(change) << as_insert(change)
        end
      end
    end
  end
end
