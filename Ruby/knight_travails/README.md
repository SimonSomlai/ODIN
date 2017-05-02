<b>Algorithm that finds the most efficiënt path from one square on a chess-board to another for a knight</b>

<img src="http://0.tqn.com/d/chess/1/0/6/-/-/-/KnightMoves.gif">

```ruby
game = Knight.new
game.knight_moves([0, 0],[5,4])

[[0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7]]
[[0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6]]
[[0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5], [7, 5]]
[[0, 4], [1, 4], [2, 4], [3, 4], [4, 4], "FINISH", [6, 4], [7, 4]]
[[0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3]]
[[0, 2], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2]]
[[0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1]]
["START", [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]

Bottom row = [[0, 0]]

 Turn 1;
Knight starts at square [0, 0] and wants to move towards [5, 4].
-> Found 2 possible moves: [[1, 2], [2, 1]]
Bottom row = [[1, 2], [2, 1]]

 Turn 2;
Knight starts at square [1, 2] and wants to move towards [5, 4].
-> Found 6 possible moves: [[0, 4], [2, 4], [3, 3], [3, 1], [2, 0], [0, 0]]
Knight starts at square [2, 1] and wants to move towards [5, 4].
-> Found 6 possible moves: [[0, 2], [0, 0], [1, 3], [3, 3], [4, 2], [4, 0]]
Bottom row = [[0, 4], [2, 4], [3, 3], [3, 1], [2, 0], [0, 0], [0, 2], [1, 3], [4, 2], [4, 0]]

 Turn 3;
Knight starts at square [0, 4] and wants to move towards [5, 4].
-> Found 4 possible moves: [[1, 6], [2, 5], [2, 3], [1, 2]]
Knight starts at square [2, 4] and wants to move towards [5, 4].
-> Found 8 possible moves: [[0, 5], [0, 3], [1, 6], [3, 6], [4, 5], [4, 3], [3, 2], [1, 2]]
Knight starts at square [3, 3] and wants to move towards [5, 4].
-> Found 8 possible moves: [[1, 4], [1, 2], [2, 5], [4, 5], [5, 4], [5, 2], [4, 1], [2, 1]]
Knight starts at square [3, 1] and wants to move towards [5, 4].
-> Found 6 possible moves: [[1, 2], [1, 0], [2, 3], [4, 3], [5, 2], [5, 0]]
Knight starts at square [2, 0] and wants to move towards [5, 4].
-> Found 4 possible moves: [[0, 1], [1, 2], [3, 2], [4, 1]]
Knight starts at square [0, 0] and wants to move towards [5, 4].
-> Found 2 possible moves: [[1, 2], [2, 1]]
Knight starts at square [0, 2] and wants to move towards [5, 4].
-> Found 4 possible moves: [[1, 4], [2, 3], [2, 1], [1, 0]]
Knight starts at square [0, 0] and wants to move towards [5, 4].
-> Found 2 possible moves: [[1, 2], [2, 1]]
Knight starts at square [1, 3] and wants to move towards [5, 4].
-> Found 6 possible moves: [[0, 5], [2, 5], [3, 4], [3, 2], [2, 1], [0, 1]]
Knight starts at square [3, 3] and wants to move towards [5, 4].
-> Found 8 possible moves: [[1, 4], [1, 2], [2, 5], [4, 5], [5, 4], [5, 2], [4, 1], [2, 1]]
Knight starts at square [4, 2] and wants to move towards [5, 4].
-> Found 8 possible moves: [[2, 3], [2, 1], [3, 4], [5, 4], [6, 3], [6, 1], [5, 0], [3, 0]]
Knight starts at square [4, 0] and wants to move towards [5, 4].
-> Found 4 possible moves: [[2, 1], [3, 2], [5, 2], [6, 1]]

"Search ended! Reached [5, 4] in 3 turns!"
[[0, 0], [1, 2], [3, 3], [5, 4]]
```
