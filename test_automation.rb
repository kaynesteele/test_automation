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

class TestAutomation
    @temp
    def initialize
        @temp=Calc.new
    end

    def verify_button(button, expected)
        if button == 1 and @temp.button1==expected
            p "Pass"
        elsif button == 2 and @temp.button2==expected
            p "Pass"
        elsif button == "operator" and @temp.operation==expected
            p "Pass"
        else
            p "error"
        end
    end


    def is_operator(obj)
        @valid_arr=["+", "-", "/", "*"]
        if @valid_arr.include?(obj)
            true
        else
            false
        end
    end

    def is_int(obj)
        if obj.is_a?(Integer)
            true
        else
            false
        end
    end

    def click_button(button, value)
        if button == 1 and is_int(value)
            @temp.button1=value
        elsif button == 2 and is_int(value)
            @temp.button2=value
        elsif button == "operator" and is_operator(value)
            @temp.operation=value
        else
            p "error"
        end
    end
    def get_answer()
        return @temp.get_answer()
    end

    def verify_answer(expected)
        if get_answer() == expected
            p "Pass"
        else
            p "Fail"
        end
    end
end

t = TestAutomation.new

t.click_button(1,20)
t.verify_button(1,30)
t.click_button(2,50)
t.verify_button(2,50)
t.click_button("operator","+")
t.verify_button("operator", "+")
p t.get_answer()
t.verify_answer(70)
