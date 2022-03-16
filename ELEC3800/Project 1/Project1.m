%% Section 1
trials = 100000;
flip = rand(trials,4);
heads = (flip >= 0.5);
ALL4 = sum(all(heads,2));
percentheads = ALL4/trials
%% Section 2
trials = 1000;
flip = rand(trials,100);
heads = (flip >= 0.55);
percentheads = sum(heads)/trials