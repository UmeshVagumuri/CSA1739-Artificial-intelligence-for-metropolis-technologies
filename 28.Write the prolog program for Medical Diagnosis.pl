% Facts about diseases and their symptoms
% disease(Disease, [List of Symptoms]).
disease(flu, [fever, cough, sore_throat, runny_nose, headache]).
disease(cold, [runny_nose, sneezing, sore_throat, cough]).
disease(covid, [fever, cough, shortness_of_breath, fatigue, loss_of_taste]).
disease(strep_throat, [sore_throat, fever, swollen_lymph_nodes]).
disease(allergy, [sneezing, runny_nose, itchy_eyes, headache]).

% Rule to check if a list of symptoms matches a disease
has_symptoms(Disease, Symptoms) :-
    disease(Disease, DiseaseSymptoms),
    subset(Symptoms, DiseaseSymptoms).

% Rule to diagnose diseases based on symptoms
diagnose(Symptoms, Diagnosis) :-
    findall(Disease, has_symptoms(Disease, Symptoms), Diagnosis).

% Example queries
% Diagnose diseases based on given symptoms
% ?- diagnose([fever, cough, sore_throat], Diagnosis).
% Diagnose diseases based on different symptoms
% ?- diagnose([runny_nose, sneezing], Diagnosis).

% Helper predicate to check if all elements of one list are in another
subset([], _).
subset([H|T], List) :-
    member(H, List),
    subset(T, List).
