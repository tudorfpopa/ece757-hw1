% Read serial baseline
content = fileread('../outputs/output.txt');
total_time = regexp(content, 'Execution time in cycles: (\d+)', 'tokens');
serial_time = str2double(total_time{1}{1});

% Read parallel execution times
N = [2 3 4 5 6 7 8 9 10 11 12];
speedup = zeros(1, length(N));

for i = 1:length(N)
    content = fileread(sprintf('../outputs/output_pthreads_%d.txt', N(i)));
    t = regexp(content, 'Average execution time: (\d+)', 'tokens');
    parallel_time = str2double(t{1}{1});
    speedup(i) = serial_time / parallel_time;
end

% prepend N=1 with speedup=1
N = [1 N];
speedup = [1 speedup];

plot(N, speedup, '-o');
for i = 1:length(N)
    if N(i) == 11
        text(N(i), speedup(i) - 0.3, sprintf('  (N=%d, %.2f)', N(i), speedup(i)), 'Color', 'black');
    else
        text(N(i), speedup(i), sprintf('  (N=%d, %.2f)', N(i), speedup(i)), 'Color', 'black');
    end
end
xlabel('Number of threads', 'Color', 'black');
ylabel('Speedup', 'Color', 'black');
title('Measured Speedup', 'Color', 'black', 'FontSize', 14);
xlim([0 14]);
set(gca, 'XColor', 'black', 'YColor', 'black', 'FontSize', 12);
drawnow;
fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 6 5];
fig.PaperSize = [6 5];
print(gcf, '../outputs/pthreads_plot.pdf', '-dpdf', '-r300');
