%%%%%%%%%%%%%%%%%%%% Run all tests in this folder %%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;

% Save original directory
oldDir = pwd;

% Go to test directory - change this on your system
cd('C:\Users\apoca\Documents\MATLAB\RoomRecommendation\testingFiles')

% Run tests
runtests

% Reset working directory
cd(oldDir);