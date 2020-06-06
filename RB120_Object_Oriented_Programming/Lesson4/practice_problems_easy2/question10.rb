=begin

Benefits of OOP:

1. Breaking down one big problem into smaller pieces
  - reduce dependency of variables downstream in the program to variables upstream of the program
  - Smaller codes are simpler to test individual functions, so it is easier to isolate and debug (benefit of encapsulation)

2. Reusability
  - Smaller codes are less specific to a specific tasks, which means they are more reusable in different scenarios, as they are more general
  - Inheritance/mixins also ieduce code duplication

3. Model real world complexity
  - can better model complex real world problems with meaningful nouns and verbs for objects, states and behaviors
  - In real world problems, there are many moving parts that interact in a systematic way
    - It would be really difficult to write a big procedural program to account for the spefics of each elements in a system

4. Easier collaboration
  - IT is easier to collaborate wiht other programmers because by breaking down the problems into specific classes, each programmer can be expert at one part of the problem
  - Combining the best possible pieces of code toegther only require exposing interfacing methods that don't corrupt different classes, so trouble shooting in the assembly process only requires debugging the assembly process

=end


#Launch School answer
=begin

Creating objects allows programmers to think more abstractly about the code they are writing.
Objects are represented by nouns so are easier to conceptualize.
It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
It allows us to easily give functionality to different parts of an application without duplication.
We can build applications faster as we can reuse pre-written code.
As the software becomes more complex this complexity can be more easily managed.

=end