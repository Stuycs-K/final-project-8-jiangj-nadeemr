# Work Log

## Jonathan J

### 5/22/2023 CW

I finished setting up the shell for the User Class and writing annotations for each method in the class.

### 5/22/2023 HW

I added some code for the methods in the User class, they are still incomplete because it requires for some of the methods in the token class to be set up, but the core of the methods are there.

### 5/23/2023 CW
 
I finished the accessor methods for the User Class and designed the gameboard and how it would look. Going to work on implementing the constructor now.

### 5/23/2023 HW

Finished the gameboard method.

### 5/24/2023 CW

Worked on converting the gameboard method array into a processing drawing.

### 5/24/2023 HW

Worked on incorporating the red tokens into the processing drawing, will use the code to do the other colors.

### 5/25/2023 CW

Finished on getting all the colored tokens into their respective homeyards and started the method to allow them to move out of their homeyard.

### 5/25/2023 HW

Worked on simplifying the code in the game class so it's easier to work on and then I started working on more code for the user class. Was able to get the accessor methods done and started new ideas for the swapping of turns.

### 5/26/2023 CW

Worked on correcting the spawn method so the tokens would move out of the homeyard in the correct destinations. Then I was able to test the move method with the simplified code and it worked, but I had to do a lot of debugging since the code was so messy.

### 5/26/2023 HW

Worked on the mouseClicked method but it didn't work, going to try to figure out why even though I click on a specific token, it only moves one specific token. Also was able to start new methods for new ideas with the turn based mechanics.

### 5/29/2023 HW

Finished the turn based mechanics and was able to swap between users once a move was made.

### 5/30/2023 CW

Finished the mouse Pressed method, it now works when I click a token, it moves THAT token only, which is a major mechanic of the game.

### 5/30/2023 HW

Made the conditional and the helper methods to ensure that you can only move the tokens after you roll the dice after clicking the dice once and then the token after. The dice and the amount the token actually moves is a little messed up though.

### 5/31/2023 CW

Fixed the dice and token bug, made the random number you a get a public variable to debug the error. I added triangles to represent the changed spawn locations and set the token's spawn location to the correct location.

### 5/31/2023 HW

Added the end goal of the triangle and made a specific set of conditionals to allow the tokens to move towards it once it was close enough. I also added some code for the dice, which prevents users from clicking and moving tokens in the homebase when they did not roll a 6. 
## Raihan N

### 5/22/2023

CW: I finished the setting up the Ludo class with all the annotations for each method in the class.
HW: Finished some methods for Ludo and finish the Ludo constructor. Still waiting on certain classes to be completed before doing the other methods.

### 5/23/2023
CW: Worked on designing the gameboard and how it would work. Also added Token class with annotations
HW: Finished some methods for Token class and finished its constructor.

### 5/24/2023
CW: Worked with Jonathan in-class to create the board on processing -- got the sketch on processing sucessfully.
HW: Worked on trying to move the tokens based on what Jonathan made; added tokens to green home base.

### 5/25/2023
CW: Worked on adding tokens to each spawn (picked up from where Jonathan left off). Worked on token movement logic, got horizontal movement working. Added checkTouching() method!
HW: Worked on moving one token from each base outside of the homebase; discussed ways to improve codebase to prevent repetitive code. Almost complete with some phases. 

## 5/26/2023
CW: Added in the dice that will be click-able. Worked on fixing boundaries so tokens don't leave the map (still a work in progress). Also worked on movement for multiple tokens.

## 5/29/2023
HW: Worked on mechanics for boundaries; discussed how to prevent the tokens from going out of bounds. Trying to allow the user to pick which token to move. (wip)

## 5/30/2023
CW: Tokens can now move properly around the entire board on click -- properly works for all tokens!
HW: Made it so you can't click anywhere for a token to move -- you must click on the dice. Upon clicking on the dice, it will reflect the number the dice returns. (to-do: add a delay to allow the user to pick what to do). Also displayed who's turn it is.

## 5/31/2023
CW: Worked on a scoreboard and planning for demo + looking into dice roll bug.
HW: Finished scoreboard to display status of the game. Also added a status for when the game is waiting for a user to roll their dice, to explictly show who's turn it is.

## 6/1/2023
HW: Fixed scoreboard bugs, worked a bit on interactions, worked on README, and helped prepared demos for demo branch.
