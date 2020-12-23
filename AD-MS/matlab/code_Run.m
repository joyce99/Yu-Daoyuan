% DEMO for testing MEDA on Office+Caltech10 datasets
for iter = 1:1
    if iter==1
        Datapath1= ['C:\Users\Administrator.SC-201905271418\Desktop\transferlearning-master\data\imagedata\USPS_vs_MNIST.mat'];
        load(Datapath1);
        src='USPS';
        tgt='MNIST';
    elseif iter==2
        Datapath1= ['C:\Users\Administrator.SC-201905271418\Desktop\transferlearning-master\data\imagedata\MNIST_vs_USPS.mat'];
        load(Datapath1);
    end
     
        feas = X_src';
         fts = feas ./ repmat(sum(feas,2),1,size(feas,2)); 
        Xs = zscore(fts,1);    clear fts
        Ys =Y_src;           clear labels
        clear feas
        feas = X_tar';
        fts = feas ./ repmat(sum(feas,2),1,size(feas,2)); 
        Xt = zscore(fts,1);    clear fts
        Yt = Y_tar;            clear labels
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

