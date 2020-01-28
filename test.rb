require_relative 'calc.rb'
class TestAutomation
    @temp
    def initialize
        @temp=Calc.new
    end

    def return_button(number)
        if number == 1 
            return @temp.button1
        elsif number == 2
            return @temp.button2
        elsif number == "operator"
            return @temp.operation
        end
    end

    def verify_button(button, expected)
        but = return_button(button)
        if  but==expected
            p  "Pass| Value: " + but.to_s + " Expected: " + expected.to_s
        else
            p  "Fail| Value: " + but.to_s + " Expected: " + expected.to_s
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
        if obj.is_a?(Float) or obj.is_a?(Integer)
            true
        else
            false
        end
    end

    def click_button(button, value)
        if button == 1 and is_int(value)
            @temp.button1=value
            p value.to_s
        elsif button == 2 and is_int(value)
            @temp.button2=value
            p value.to_s
        elsif button == "operator" and is_operator(value)
            @temp.operation=value
            p value.to_s
        else
            p "error with click_button"
        end
    end

    def get_answer(operator)
        case operator[4]
        when "+"
            return operator[3] + operator[5]
        when "-"
            return operator[3] - operator[5]
        when "*"
            return operator[3] * operator[5]
        when "/"
            return operator[3] / operator[5]
        else
            p "error with operation"
        end
    end

    def verify_answer(operator)
        if get_answer(operator) == @temp.get_answer
            p "Pass| Value: " + @temp.get_answer().to_s + " Expected " + get_answer(operator).to_s
        else
            p "Fail, Value: " + @temp.get_answer().to_s + " Expected " + get_answer(operator).to_s
        end
    end

end
