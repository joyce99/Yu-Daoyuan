% DEMO for testing MEDA on Office+Caltech10 datasets 
for iter = 1:3
    if iter==1
        Datapath1= ['C:\Users\Administrator.SC-201905271418\Desktop\SRAAR\data\Comp_vs_Rec.mat'];
        load(Datapath1);
    elseif iter==2
        Datapath1= ['C:\Users\Administrator.SC-201905271418\Desktop\SRAAR\data\Comp_vs_Sci.mat'];
        load(Datapath1);
    else
        Datapath1= ['C:\Users\Administrator.SC-201905271418\Desktop\SRAAR\data\Comp_vs_Talk.mat'];
        load(Datapath1);
    end
     
        feas = full(src_X)';
     %    fts = feas ./ repmat(sum(feas,2),1,size(feas,2)); 
        Xs = zscore(feas,1);    clear fts
        Ys =src_labels;           clear labels
        clear feas
        feas = full(tar_X)';
     %   fts = feas ./ repmat(sum(feas,2),1,size(feas,2)); 
        Xt = zscore(feas,1);    clear fts
        Yt = tar_labels;            clear labels
        clear feas
        
        % meda
        options.d = 100;
        options.rho = 1.0;
        options.p = 1;
        options.lambda = 1.0;
        options.eta = 0.1;
      options.T = 10;

        [Acc,~,~,~] = MEDA(Xs,Ys,Xt,Yt,options);
        fprintf('%s --> %s: %.2f accuracy \n\n', src, tgt, Acc * 100);
end

