clc
clear all
close all

a=[1 1 1; 1 0 1; 1 1 1]
af=imfill(a,'holes')

b=~a
bf=imfill(b,'holes')

a=a;