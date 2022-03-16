trials = 100000;
flip = rand(trials,4);
heads = (flip >= 0.5);
ALL4 = sum(all(heads,2));
percentheads = ALL4/trials