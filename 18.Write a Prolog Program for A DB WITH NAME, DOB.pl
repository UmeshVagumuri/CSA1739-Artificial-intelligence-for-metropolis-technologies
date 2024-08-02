% Define facts for the database
person('Alice', date(1990, 5, 15)).
person('Bob', date(1985, 12, 23)).
person('Carol', date(1978, 3, 9)).
person('David', date(2000, 1, 1)).

% Define a rule to find a person's date of birth given their name
find_dob(Name, DOB) :-
    person(Name, DOB).

% Define a rule to find people born in a specific year
born_in_year(Year, Name) :-
    person(Name, date(Year, _, _)).

% Define a rule to find people born before a specific year
born_before(Year, Name) :-
    person(Name, date(Y, _, _)),
    Y < Year.

% Define a rule to add a new person to the database
add_person(Name, Year, Month, Day) :-
    assertz(person(Name, date(Year, Month, Day))).

% Define a rule to remove a person from the database
remove_person(Name) :-
    retract(person(Name, _)).
