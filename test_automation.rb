require_relative 'test.rb'

t = TestAutomation.new

inputs = [1,"operator", 2, 14, "+", 3.0]
expected = [1, "operator", 2, 4, "/", 2]

t.click_button(inputs[0],inputs[3])
t.click_button(inputs[1],inputs[4])
t.click_button(inputs[2],inputs[5])
t.verify_button(expected[0],expected[3])
t.verify_button(expected[1],expected[4])
t.verify_button(expected[2],expected[5])


p "Input Answer: " + t.get_answer(inputs[4]).to_s
t.verify_answer(expected).to_s
