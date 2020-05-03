function ex4(ex)

    switch ex
        case 'a'
            fprintf('Part A\n')
            lambda = [100, 200, 100, 200, 500, 1000, 500, 1000];
            C = [2, 2, 2, 2, 10, 10, 10, 10];
            f = [100000, 100000, 10000, 10000, 100000, 100000, 10000, 10000];
            simulate(lambda, C, f, 10, 1000, 'res_a.mat')
        case 'c'
            fprintf('Part C\n')
            lambda = [100, 200, 100, 200, 500, 1000, 500, 1000];
            C = [2, 2, 2, 2, 10, 10, 10, 10];
            f = [100000, 100000, 10000, 10000, 100000, 100000, 10000, 10000];
            simulate(lambda, C, f, 10, 100000, 'res_c.mat')
        case 'd'
            fprintf('Part D\n')
            lambda = [100, 200, 100, 200, 500, 1000, 500, 1000];
            C = [2, 2, 2, 2, 10, 10, 10, 10];
            f = [100000, 100000, 10000, 10000, 100000, 100000, 10000, 10000];
            simulate(lambda, C, f, 1000, 1000, 'res_d.mat')
        case 'e'
            lambdas = [100,200,500,1000];
            Cs = [2e6, 2e6, 10e6, 10e6];
            fprintf('MM1 average delay')
            avg_delay_mm1(lambdas, Cs)
            fprintf('MG1 average delay')
            avg_delay_mg1(lambdas, Cs)
        case 'f'
            lambda = [50, 100, 150, 200, 250, 270, 290, 310, 330, 350, 400, 450, 500];
            C = ones(1,length(lambda))*2;
            f = ones(1,length(lambda))*10000;
            %simulate(lambda, C, f, 10, 100000, 'res_f.mat');
            draw_plots(lambda, 'res_f.mat');
        case 'g'
            lambda = [50, 100, 150, 200, 250, 270, 290, 310, 330, 350, 400, 450, 500];
            C = ones(1,length(lambda))*2;
            f = ones(1,length(lambda))*100000;
            %simulate(lambda, C, f, 10, 100000, 'res_g.mat');
            draw_plots(lambda, 'res_g.mat');
        case 'h'
            lambda = [250,  500,  750, 1000, 1250, 1350, 1450, 1550, 1650, 1750, 2000, 2250, 2500];
            C = ones(1,length(lambda))*10;
            f = ones(1,length(lambda))*1000;
            %simulate(lambda, C, f, 10, 100000, 'res_f.mat');
            draw_plots(lambda, 'res_f.mat');
        case 'i'
            lambda = [250,  500,  750, 1000, 1250, 1350, 1450, 1550, 1650, 1750, 2000, 2250, 2500];
            C = ones(1,length(lambda))*10;
            f = ones(1,length(lambda))*100000;
            %simulate(lambda, C, f, 10, 100000, 'res_g.mat');
            draw_plots(lambda, 'res_g.mat');
        otherwise
            fprintf('Unknow operation requested!\n')
    end

end

