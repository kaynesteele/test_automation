class Calc
    def operation
        @operation
    end

    def operation=(value)
        @operation=value
    end

    def button1=(value)
        @button1 = value
    end

    def button1
        @button1
    end

    def button2=(value)
        @button2 = value
    end

    def button2
        @button2
    end

    def get_answer()
        case @operation
        when "+"
            return button1 + button2
        when "-"
            return button1 - button2
        when "*"
            return button1 * button2
        when "/"
            return button1 / button2
        else
            p "error with operation"
        end
    end

end
