% Define facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(cherry, red).
fruit_color(kiwi, green).
fruit_color(plum, purple).
fruit_color(peach, pink).
fruit_color(pineapple, brown).

% Rule to find the color of a fruit
find_fruit_color(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Example queries
% ?- find_fruit_color(apple, Color).
% ?- find_fruit_color(banana, Color).
% ?- find_fruit_color(grape, Color).
