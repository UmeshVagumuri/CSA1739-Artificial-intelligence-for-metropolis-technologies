% Define facts for the database
% planet(Name, DistanceFromSunInMillionKm, DiameterInKm, NumberOfMoons, HasRings).

planet('Mercury', 57.9, 4879, 0, no).
planet('Venus', 108.2, 12104, 0, no).
planet('Earth', 149.6, 12742, 1, no).
planet('Mars', 227.9, 6779, 2, no).
planet('Jupiter', 778.5, 139820, 79, yes).
planet('Saturn', 1433.5, 116460, 83, yes).
planet('Uranus', 2872.5, 50724, 27, yes).
planet('Neptune', 4495.1, 49244, 14, yes).

% Define a rule to find the distance of a planet from the sun
find_distance_from_sun(Planet, Distance) :-
    planet(Planet, Distance, _, _, _).

% Define a rule to find the diameter of a planet
find_diameter(Planet, Diameter) :-
    planet(Planet, _, Diameter, _, _).

% Define a rule to find the number of moons of a planet
find_number_of_moons(Planet, Moons) :-
    planet(Planet, _, _, Moons, _).

% Define a rule to check if a planet has rings
has_rings(Planet, Rings) :-
    planet(Planet, _, _, _, Rings).

% Define a rule to find planets within a specific distance range from the sun
planets_within_distance(MinDistance, MaxDistance, Planet) :-
    planet(Planet, Distance, _, _, _),
    Distance >= MinDistance,
    Distance =< MaxDistance.

% Define a rule to find planets with a specific number of moons or more
planets_with_min_moons(MinMoons, Planet) :-
    planet(Planet, _, _, Moons, _),
    Moons >= MinMoons.

% Define a rule to add a new planet to the database
add_planet(Name, Distance, Diameter, Moons, Rings) :-
    assertz(planet(Name, Distance, Diameter, Moons, Rings)).

% Define a rule to remove a planet from the database
remove_planet(Name) :-
    retract(planet(Name, _, _, _, _)).
