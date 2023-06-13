## Development Log
# Working Features:
- Scoreboard to display live updates to game (all 4 users are displayed. 3 users are bots)
- Start menu allowing user to pick color. Sound plays when color is picked successfully.
- Different modes to test different mechanics of the game (interactions, winning, gameplay)
- Token movement & animation
- Dice roll & dice sound effect
- Token interactions (one token kills the other and sends it back to its homebase)
- Automatic roll dice for the 3 users (bots). Delays between each turn to see what's going on. Sped up movement for bots.
- You get to select which token to move after rolling the dice (random for bots).
- Once you get 4 tokens into the endpoint, game stops and displays mini-victory screen. 

# Broken Features:
- "Block" feature -- essentially, if there were **two** tokens of the same color on one space and a token of a different color lands on that space, it would
get sent back to its homebase since the two tokens act as a block. Was half-working and decided to scrap it out because it wasn't working properly.
- For the last mode, we make it so that there are already 3 tokens finished, but this does not appear visually. Once you get the last token to the endpoint, you will win the game,
but visually there are still 3 tokens in the homebase.

# Content resources:
- Only the Processing References were used.
