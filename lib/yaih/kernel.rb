module Kernel

    def history_a(n=Readline::HISTORY.size)
        size=Readline::HISTORY.size
        Readline::HISTORY.to_a[(size - n)..size-1]
    end

    def decorate_h(n)
        size=Readline::HISTORY.size
        ((size - n)..size-1).zip(history_a(n)).map {|e| e.join(" ")}
    end

    def h(n=10)
        entries = decorate_h(n)
        puts entries
        entries.size
    end

    def hgrep(word)
        matched=decorate_h(Readline::HISTORY.size - 1).select {|h| h.match(word)}
        puts matched
        matched.size
    end

    def h!(start, stop=nil)
        stop=start unless stop
        code = history_a[start..stop]
        code.each_with_index { |e,i|
            irb_context.evaluate(e,i)
        }
        Readline::HISTORY.pop
        code.each { |l|
            Readline::HISTORY.push l
        }
        puts code
    end

end
