# Computer Simulator
![Unit test](https://github.com/Zogoo/computer_simulator/actions/workflows/run-test.yml/badge.svg)
Build a computer simulator that supports executing:
Instructions
- `MULT`: Pop the 2 arguments from the stack, multiply them and push the result back to the stack 
- `CALL addr`: Set the program counter (PC) to `addr`
- `RET`: Pop address from stack and set PC to address
- `STOP`: Exit the program
- `PRINT`: Pop value from stack and print it - `PUSH arg`: Push argument to the stack

# Requirement
1. Simple as possible
2. Error handling
3. Unit test
4. Comments and explanation with TODO and FIXME inline comments for improvement
5. Grasp possible corner case and missing logic but no need to implement
6. Spend short amount of time as possible, design should be possible as extendable


# Challenges & Solution
I have could see following main challenges from this "coding challenge". 
You always can assume and imagine future usage or you wanted to add your shiny ideas, 
But I would like to stick my solution as prototype version which able to explain my idea and
bring visibility when we have discussion about further issues and missing point.
Even do you missed lot of cases main design should be change drastically or requires rewrite it again.
1. Stack memory data structure
  Since structure of instruction is not complex and complicated I could use simple array.
2. Logic
   2 main logic should be there. First one is Stack memory handler and Execution.
3. Validations
   1. Whitelist of instrucitons
   2. Parameter validation for CALL and PUSH instruction
   3. Certian command required preparation validation. For example CALL instruction requires 3 previous step which PUSH attributes.
4. Test
   It's possible to use mini test or such as gem. But those are require additional things to do. So, to make it simple as possible Ruby simple code should work fine for test.
5. Explanation or Comments
   README is common and easiest way to explain things. Ofcourse there should be comments if code it self is not explaining itself.

# TODO (Status: 70%)
1. Validate input before execute them. That might be more effective and less use resources.
2. Support local variables and local frame data.
3. Add more corner test cases for allowed commands combintations. And improve logics to handle complicated cases.
4. To use test gem like minitest, rspec