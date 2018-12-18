clc
clear
format compact;

% for n = 1000:25:2500
%     tic;
%     res = Main(n);
%     time = toc;
%     res = sort(res);
%     expected = WypiszWartosci(n);
%     eq = CompareArrays(res, expected);
%     if(eq ~= 1)
%         disp(["Pierwszy b³êdny wynik, n =", n]); 
%         break;
%     end
%     ["n", "correct", "timeTaken";n, eq, time]
% end

sum = 0;
for i = 1:10
    n=1000;
    tic;
    res = Main(n);
    time = toc;
    sum = sum + time;
end
avg = sum / 10