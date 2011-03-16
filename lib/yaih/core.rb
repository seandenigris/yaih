module Yaih
    module Core

        extend self

        def entries(n=Readline::HISTORY.size)
            size=Readline::HISTORY.size
            Readline::HISTORY.to_a[(size - n)..size-1]
        end

        def decorate(n)
            size=Readline::HISTORY.size
            ((size - n)..size-1).zip(entries(n)).map {|e| e.join(" ")}
        end

    end
end
