module Kernel # Adding methods to Kernel module makes possible to use them in irb.

    # Prints the latest n lines from IRB
    # history. It decorates each line with
    # the correspondent command number.
    # @return [Fixnum] number of printed lines.
    def h(n=10)
        entries = Yaih::Core.decorate(n)
        puts entries
        entries.size
    end

    # It greps history and prints matched lines.
    # @return [Fixnum] number of printed lines.
    # @todo Consider to highlight matched part.
    def hgrep(word)
        matched=Yaih::Core.decorate(Readline::HISTORY.size - 1).select {|h| h.match(word)}
        puts matched
        matched.size
    end

    # It takes the range of lines to execute,
    # evals the lines and prints them.
    # @return [nil]
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
