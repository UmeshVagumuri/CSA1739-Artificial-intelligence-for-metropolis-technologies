% Define facts about diseases and their recommended diets
% disease(Disease, RecommendedDiet).
disease('Diabetes', 'Low-carbohydrate diet').
disease('Hypertension', 'Low-sodium diet').
disease('High Cholesterol', 'Low-fat diet').
disease('Obesity', 'Calorie-controlled diet').
disease('Irritable Bowel Syndrome', 'Low-FODMAP diet').
disease('Celiac Disease', 'Gluten-free diet').

% Define a rule to suggest a diet based on the disease
suggest_diet(Disease, Diet) :-
    disease(Disease, Diet),
    write('For '), write(Disease), write(', the recommended diet is: '), write(Diet), nl.

% Example queries
% Suggest a diet for Diabetes
% ?- suggest_diet('Diabetes', Diet).
% For Diabetes, the recommended diet is: Low-carbohydrate diet.

% Suggest a diet for Hypertension
% ?- suggest_diet('Hypertension', Diet).
% For Hypertension, the recommended diet is: Low-sodium diet.
