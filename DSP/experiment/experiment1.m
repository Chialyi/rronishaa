%配置参数
f_h = 100;
t = 0:1/f_h:1-1/f_h;

%信号表示
x_1 = sin(2*pi*f_h*t)/t;
x_1(t==0) = 2 * pi * f_h;

%信号处理
y = fftshift(fft(x_1));
dt = 1/f_h;%采样间隔
y = y * dt;  % 归一化

%绘图
syms x_1; 
%幅度谱
fplot(abs(y),[0,120]);


% 根据奈奎斯特采样定理，确定采样频率
nyquist_sampling_rate = 2 * abs(f_h);
fprintf('根据奈奎斯特定理，合适的采样频率为: %f Hz\n', nyquist_sampling_rate);

%时域采样
n = [0.3*f_h,0.6*f_h,1.2*f_h, 1.8*f_h, 2.4*f_h];
x_1(n) = x_1(t=n);



