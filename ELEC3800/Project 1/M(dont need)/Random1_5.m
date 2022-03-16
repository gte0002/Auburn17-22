trials = 1000;
flip = rand(trials,100);
heads = (flip >= 0.55);
percentheads = sum(heads)/trials