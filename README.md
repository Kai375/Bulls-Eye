# Bulls-Eye
A Number Guessing Game.

### Discription:
A program that plays Bulls-Eye.

* 1. The program will schedule an input procedure called `get_number` that will receive a number from the user in
     
      `syscall 12`- 3 characters in the range `[0,9]`.   
     
     Make sure that the characters are different from each other, if the input is invalid, then re-enter it.
     
     The input will be inserted into an array defined in `.data` named `bool`, whose address the `get_number` procedure will receive as a
     
     parameter.

 * 2. Now in the loop, you have to try to guess the 3 characters in `bool`, We will use the auxiliary array `guess`,
      
      which is also defined in `.data`.
      
       
       - From the `main` function, a procedure named `get_guess` must be called that accepts as parameters the address of `bool` and the
         
         address of `guess`.

         The `get_guess` procedure receives a 3-character string (`syscall 8`) and stores them in the auxiliary array `guess`.

       - Now the procedure `get_guess` calls a comparison procedure named `compare` that receives as input the addresses of arrays
         
         `bool` and `guess` and performs a comparison between the arrays.
         
         - If we got a match of characters and a match of their positions, then `b` will be displayed (to indicate a Bull).
         
         - If we got a match of characters but not a match of positions, then `p` will be displayed (to indicate a hit).
           
         -  If there is no match at all between all three characters, then `n` will be displayed.
        
         -  If there are three `b`'s, then the game will end in a **Bulls-Eye** (this must be done by returning a value of `-1`
           
            in the `$v0 register` from the `compare` procedure, which will cause a return of `-1` in the `$v0 register` from the
            
            `get_number` procedure, which will be the signal for `main`  to end the program).                                                                   

  * 3.   After the game ends, the player will be asked whether to start another game or finish.  

   
      



# String Formatter
 A rudimentary string manipulation function.

 ### Discription:

The program will ask the user to type (`syscall 8`) a number of words separated by a single space character,

and will record the words into the string `StringBuffer`. 

The maximum length of the string is 80 characters.

The program works with uppercase or lowercase letters (or both).

The program will go through the string and check the following: (The results will be listed to the right of the corresponding string)

  * 1. Count how many words are in the string.
  * 2. Count how many letters are in the longest word in the string.
  * 3. Count how many letters are in the shortest word in the string.
  * 4. Calculate the difference between the number of letters in sections ii and iii.
  * 5. Calculate the number of characters in the string, excluding spaces characters.
    
