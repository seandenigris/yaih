module Kernel

    def h(n=10)
        entries = Yaih::Core.decorate(n)
        puts entries
        entries.size
    end

    def hgrep(word)
        matched=Yaih::Core.decorate(Readline::HISTORY.size - 1).select {|h| h.match(word)}
        puts matched
        matched.size
    end

    def h!(start, stop=nil)
        stop=start unless stop
        lines = Yaih::Core.entries[start..stop]
        lines.each_with_index { |e,i|
            irb_context.evaluate(e,i)
        }
        Readline::HISTORY.pop
        lines.each { |l|
            Readline::HISTORY.push l
        }
        puts lines
    end

end
