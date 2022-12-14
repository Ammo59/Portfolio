%
% Aramis Kelkelyan
% MAE 205 Section 11/12
%
% Bonus Laboratory II Part B
%------------------------------------------------------------------------
%%
%Write a script using your function to plot the trajectories of baseball throws with the given initial velocities and angles of release shown in the table below
%Use loops to calculate the x & y position vectors for all conditions(below) and create the three plots.
%I recommend writing the code for each piece of the project, find the common elements, and then build the loops.
%Be sure to include bold facedtitles, xlabels, ylabels,units, grids, and legends on each figure.
% Also, each angle plot should be a different colorwith various line types and linewidth of 2
%%
clear;clc;
velocity = [35,40,47.16];
angle = [7.5,9.5,11.5,35,45,55];
lstyl = {'--','-.',':','-',':','-.'};
for ii = 1:length(velocity)
    v = velocity(ii);
    figure(ii); hold on;
    axis([0 235 0 100]);
    for jj = 1:length(angle)
        a = angle(jj);
        [x,y]=Kelkelyan_ThrowTrajectory(v,a);
        plot(x,y,lstyl{jj},'LineWidth',2);%Plot y vs. x with line width 2
    end
    xlabel('Distance Thrown [m]'); %Label x axis
    ylabel('Ball Height [m]'); %Label y axis
    title(['\bf{Baseball Trajectories for release velocity of }',num2str(velocity(ii)),'\bf{m/s}']); grid on; %Title Graph, include bold faced title and grid lines
    legend('7.5\circ','9.5\circ','11.5\circ','35\circ','45\circ','55\circ','Location','NE'); 
end
