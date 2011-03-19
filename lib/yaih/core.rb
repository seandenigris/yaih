module Yaih
    module Core # This module contains methods for interefacing with IRB history

        extend self

        # Returns an array of IRB history entries
        # bases of the given n.
        def entries(n=Readline::HISTORY.size)
            size=Readline::HISTORY.size
            Readline::HISTORY.to_a[(size - n)..size-1]
        end

        # Returns an array of strings
        def decorate(n)
            size=Readline::HISTORY.size
            ((size - n)..size-1).zip(entries(n)).map {|e| e.join(" ")}
        end

    end
end
