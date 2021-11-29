clc
close all
clear all


%bytes = (1024);         % un latido
%bytes = (2048);         % dos latido
%bytes = (4096);         % cuatro latido
bytes = (8192);         % ocho latido



s = serial('COM8');
%s = serial('/dev/tty.KeySerial1');
set(s,'BaudRate',9600,'Parity','even', 'InputBufferSize',bytes)
fopen(s);
data = fread(s);
fclose(s)


figure, plot (data)