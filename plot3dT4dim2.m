
%  failurebound(1) = 1;
%  failurebound(2) = 22;
%  failurebound(3) = 37;
%  failurebound(4) = 51;
%  failurebound(5) = 65;

 failurebound(1) = 1;
 failurebound(2) = 22;
 failurebound(3) = 61;
 failurebound(4) = 100;
 failurebound(5) = 139;
 failurebound(6) = 178;

% figure('units','centimeters','position', [10 5 10 10])
% set(gcf, 'color', 'white');
% scatter3(state{1}(:, 1), state{1}(:, 2), minLCC(: ,1));
% title('t=4');
% xlabel('\alpha_{1} from Failure mode 1');
% ylabel('\alpha_{2} from Failure mode 1');
% zlabel('reward function');

% % figure('units','centimeters','position', [10 5 10 10])
% % set(gcf, 'color', 'white');
% % minLCC2 = minLCC(:, 2);
% % minLCC2 = minLCC2(1 : length(state{2}(:, 1)));
% % scatter3(state{2}(:, 1), state{2}(:, 2), minLCC2);
% % title('t=3');
% % xlabel('\alpha_{1} from Failure mode 1');
% % ylabel('\alpha_{2} from Failure mode 1');
% % zlabel('reward function');

% figure('units','centimeters','position', [10 5 10 10])
% set(gcf, 'color', 'white');
% minLCC3 = minLCC(:, 3);
% minLCC3 = minLCC3(1 : length(state{3}(:, 1)));
% scatter3(state{3}(:, 1), state{3}(:, 2), minLCC3);
% title('t=2');
% xlabel('\alpha_{1} from Failure mode 1');
% ylabel('\alpha_{2} from Failure mode 1');
% zlabel('reward function');

% figure('units','centimeters','position', [10 5 10 10])
% set(gcf, 'color', 'white');
% minLCC4 = minLCC(:, 4);
% minLCC4 = minLCC4(1 : length(state{4}(:, 1)));
% scatter3(state{4}(:, 1), state{4}(:, 2), minLCC4);
% title('t=1');
% xlabel('\alpha_{1} from Failure mode 1');
% ylabel('\alpha_{2} from Failure mode 1');
% zlabel('reward function');

% alpha1 = 0 : failurebound(1);
% alpha2 = 0 : failurebound(1);
% for i = 1 : (failurebound(1) + 1)
%     for j = 1 : (failurebound(1) + 1)
%         display([i, j]);
%         alpha = [alpha1(i), alpha2(j)];
%         display(alpha);
%         LCC(i, j) = minLCC((j - 1) * (failurebound(1) + 1) + i, 4);
%     end
% end
% 
% LCC = LCC';
% figure('units','centimeters','position', [10 5 10 10]);
% set(gcf, 'color', 'white');
% surf(alpha1, alpha2, LCC);
% xlabel('\alpha_{1}'); ylabel('\alpha_{2}'); zlabel('LCC');
% title('t=1');

% alpha1 = 0 : failurebound(2);
% alpha2 = 0 : failurebound(2);
% for i = 1 : (failurebound(2) + 1)
%     for j = 1 : (failurebound(2) + 1)
%         display([i, j]);
%         alpha = [alpha1(i), alpha2(j)];
%         display(alpha);
%         LCC(i, j) = minLCC((j - 1) * (failurebound(2) + 1) + i, 3);
%     end
% end
% 
% LCC = LCC';
% figure('units','centimeters','position', [10 5 10 10]);
% set(gcf, 'color', 'white');
% surf(alpha1, alpha2, LCC);
% xlabel('\alpha_{1}'); ylabel('\alpha_{2}'); zlabel('LCC');
% title('t=2');

% alpha1 = 0 : failurebound(3);
% alpha2 = 0 : failurebound(3);
% for i = 1 : (failurebound(3) + 1)
%     for j = 1 : (failurebound(3) + 1)
%         display([i, j]);
%         alpha = [alpha1(i), alpha2(j)];
%         display(alpha);
%         LCC(i, j) = minLCC((j - 1) * (failurebound(3) + 1) + i, 2);
%     end
% end
% 
% LCC = LCC';
% figure('units','centimeters','position', [10 5 10 10]);
% set(gcf, 'color', 'white');
% surf(alpha1, alpha2, LCC);
% xlabel('\alpha_{1}'); ylabel('\alpha_{2}'); zlabel('LCC');
% title('t=3');

alpha1 = 0 : failurebound(4);
alpha2 = 0 : failurebound(4);
for i = 1 : (failurebound(4) + 1)
    for j = 1 : (failurebound(4) + 1)
        display([i, j]);
        alpha = [alpha1(i), alpha2(j)];
        display(alpha);
        LCC(i, j) = minLCC((j - 1) * (failurebound(4) + 1) + i, 1);
    end
end

LCC = LCC';
figure('units','centimeters','position', [10 5 10 10]);
set(gcf, 'color', 'white');
surf(alpha1, alpha2, LCC);
xlabel('\alpha_{1}'); ylabel('\alpha_{2}'); zlabel('LCC');
title('t=4');
























