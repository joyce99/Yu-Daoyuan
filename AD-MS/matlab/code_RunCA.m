% DEMO for testing MEDA on Office+Caltech10 datasets
str_domains = {'caltech', 'amazon', 'webcam', 'dslr'};
list_acc = [];
for i = 1 : 4
    for j = 1 : 4
        if i == j
            continue;
        end
        src = str_domains{i};
        tgt = str_domains{j};
        load(['C:\Users\Administrator.SC-201905271418\Desktop\transferlearning-master\data/imagedata/' src '_decaf.mat']);     % source domain
        fts = feas ./ repmat(sum(feas,2),1,size(feas,2)); 
        Xs = zscore(fts,1);    clear fts
        Ys = labels;           clear labels
        
        load(['C:\Users\Administrator.SC-201905271418\Desktop\transferlearning-master\data/imagedata/' tgt '_decaf.mat']);     % target domain
        fts = feas ./ repmat(sum(feas,2),1,size(feas,2)); 
        Xt = zscore(fts,1);     clear fts
        Yt = labels;            clear labels
        
        % meda
        options.d = 20;%Ã²ËÆ18ºÃ
        options.rho = 1.0;
        options.p = 10;
        options.lambda = 10.0;
        options.eta =  0.1;
        options.T = 10;
        [Acc,~,~,~] = MEDA(Xs,Ys,Xt,Yt,options);
        fprintf('%s --> %s: %.2f accuracy \n\n', src, tgt, Acc * 100);
    end
end
