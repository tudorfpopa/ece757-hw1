N = [1 2 4 8 16];
content = fileread('../outputs/output.txt');
total_time = regexp(content, 'Execution time in cycles: (\d+)', 'tokens');
total_time = str2double(total_time{1}{1})
parallel_time = regexp(content, 'Execution time of parallelizable section in cycles: (\d+)', 'tokens');
parallel_time = str2double(parallel_time{1}{1})
p = parallel_time / total_time;
s = 1 - p;
speedup = 1./(s+(p./N));
plot(N, speedup, '-o');
for i = 1:length(N)
    text(N(i), speedup(i), sprintf('  (N=%d, %.2f)', N(i), speedup(i)), 'Color', 'black');
end
xlabel('Number of processors', 'Color', 'black');
ylabel('Speedup', 'Color', 'black');
title('Amdahl''s Law Speedup', 'Color', 'black', 'FontSize', 14);
xlim([0 18]);
set(gca, 'XColor', 'black', 'YColor', 'black', 'FontSize', 12);
drawnow;
fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 6 5];
fig.PaperSize = [6 5];
print(gcf, '../outputs/speedup_plot.pdf', '-dpdf', '-r300');
