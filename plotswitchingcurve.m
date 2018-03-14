clc;

 failurebound(1) = 1;
 failurebound(2) = 22;
 failurebound(3) = 61;
 failurebound(4) = 100;
 failurebound(5) = 139;
 failurebound(6) = 178;

 T = 4;
 t = 2;
 beta0 = 1;
 figure('units','centimeters','position', [10 5 10 10])
 set(gcf, 'color', 'white');

 for i = 1 : (failurebound(t) + 1)
     for j = 1 : (failurebound(t) + 1)
         index = i + (j - 1) * (failurebound(t) + 1);
         %x = 0 : failurebound(t);
         %y = 0 : failurebound(t);
         if and(optact{T - t + 1}(index, 1)==1, optact{T - t + 1}(index, 2)==1)
            plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t)); 
            hold on
         elseif and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==1)
             plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'Marker','o','LineStyle','none','Color',[0.5 0.5 0.5]);
             hold on
         elseif and(optact{T - t + 1}(index, 1)==1, optact{T - t + 1}(index, 2)==0)
             plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'Marker','*','LineStyle','none','Color',[0.5 0.5 0.5]);
             hold on
         elseif and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==0)
             plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'Marker','+','LineStyle','none','Color',[0.5 0.5 0.5]);
            hold on
         end
     end
 end
theta = 0;
  for i = 1 : (failurebound(t) + 1)
     for j = 1 : (failurebound(t) + 1)
         index = i + (j - 1) * (failurebound(t) + 1);
         if and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==0)
             theta = 1;
             x1 = [0 4];
             y1 = [state{T - t + 1}(index, 2)/(beta0 + t) state{T - t + 1}(index, 2)/(beta0 + t)];
             line(x1, y1, 'Color', 'red', 'LineStyle', '--', 'LineWidth', 2);
             x2 = [state{T - t + 1}(index, 1)/(beta0 + t) state{T - t + 1}(index, 1)/(beta0 + t)]; 
             y2 = [0 4];
             line(x2, y2, 'Color', 'red', 'LineStyle', '--', 'LineWidth', 2);
             break
         end
     end
     if (theta == 1)
         break
     end
  end
  title('(a)');
  xlabel('\boldmath$E(\lambda_{1})$',  'Interpreter', 'latex');
  ylabel('\boldmath$E(\lambda_{2})$',  'Interpreter', 'latex');
  set(gca,'xTick', [0 : 1 : 4], 'xlim', [0 4]) 
  set(gca,'yTick', [0 : 1 : 4], 'ylim', [0 4]) 
  ax = gca; % current axe
  ax.FontSize = 12;
  ax.FontWeight = 'bold';
annotation('textbox', [0.42163492063492 0.0185185185185181 0.17889417989418 0.097883597883598],...
    'String','\xi_{1}', 'LineStyle', 'none', 'FontWeight', 'bold', 'FontSize',12, 'FitBoxToText', 'off');
annotation('textbox', [0.0644920634920624 0.388888888888888 0.17889417989418 0.0978835978835977],...
    'String','\xi_{2}', 'LineStyle', 'none', 'FontWeight', 'bold', 'FontSize',12, 'FitBoxToText', 'off');
% annotation('textbox', [0.556 0.651 0.287 0.098], 'String', '(\xi^{+}_{1}, \xi^{+}_{2})', 'LineStyle', 'none',...
%     'FontWeight','bold', 'FontSize', 12, 'FitBoxToText', 'off');
% annotation('textbox', [0.17 0.651 0.287 0.098], 'String','(\xi^{-}_{1}, \xi^{+}_{2})', 'LineStyle','none',...
%     'FontWeight','bold', 'FontSize',12, 'FitBoxToText','off');
% annotation('textbox', [0.556 0.233 0.287 0.098], 'String','(\xi^{+}_{1}, \xi^{-}_{2})', 'LineStyle','none',...
%     'FontWeight', 'bold', 'FontSize',12, 'FitBoxToText','off');
% annotation('textbox', [0.17 0.233 0.287 0.098], 'String', '(\xi^{-}_{1}, \xi^{-}_{2})', 'LineStyle','none',...
%     'FontWeight','bold', 'FontSize',12, 'FitBoxToText','off');


 %hold off;
 
%  t = 3;
%  figure('units','centimeters','position', [10 5 20 20])
%  set(gcf, 'color', 'white');
%  title('t=3');
% 
%  for j = 1 : (failurebound(t) + 1)
%      for i = 1 : (failurebound(t) + 1)
%          index = i + (j - 1) * (failurebound(t) + 1);
%          %x = 0 : failurebound(t);
%          %y = 0 : failurebound(t);
%          if and(optact{T - t + 1}(index, 1)==1, optact{T - t + 1}(index, 2)==1)
%             plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t)); 
%             hold on
%          elseif and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==1)
%              plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'ko');
%              hold on
%          elseif and(optact{T - t + 1}(index, 1)==1, optact{T - t + 1}(index, 2)==0)
%              plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'k*');
%              hold on
%          elseif and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==0)
%              plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'k+');
%             hold on
%          end
%      end
%  end
%  hold off;
% % 
%  t = 4;
%  figure('units','centimeters','position', [10 5 20 20])
%  set(gcf, 'color', 'white');
%  title('t=4');
% 
%  for j = 1 : (failurebound(t) + 1)
%      for i = 1 : (failurebound(t) + 1)
%          index = i + (j - 1) * (failurebound(t) + 1);
%          %x = 0 : failurebound(t);
%          %y = 0 : failurebound(t);
%          if and(optact{T - t + 1}(index, 1)==1, optact{T - t + 1}(index, 2)==1)
%             plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t)); 
%             hold on
%          elseif and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==1)
%              plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'ko');
%              hold on
%          elseif and(optact{T - t + 1}(index, 1)==1, optact{T - t + 1}(index, 2)==0)
%              plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'k*');
%              hold on
%          elseif and(optact{T - t + 1}(index, 1)==0, optact{T - t + 1}(index, 2)==0)
%              plot(state{T - t + 1}(index, 1)/(beta0 + t), state{T - t + 1}(index, 2)/(beta0 + t), 'k+');
%             hold on
%          end
%      end
%  end
%  hold off;



%line(x,y,'Color','red','LineStyle','--')

%% threshold eta1 and eta2
annotation('line',[0.131 0.167],...
    [0.555 0.555],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.167 0.23],...
    [0.49 0.49],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.23 0.419],...
    [0.425 0.425],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.419 0.484],...
    [0.49 0.49],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.484 0.516],...
    [0.555 0.555],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.295 0.36],...
    [0.36 0.36],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.36 0.36],...
    [0.36 0.295],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
annotation('line',[0.36 0.419],...
    [0.295 0.295],'LineWidth',2, 'Color', [0.47 0.67 0.19]);
