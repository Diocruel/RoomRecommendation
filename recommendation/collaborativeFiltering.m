%
clc;
clear;
close all;

% Settings
noNeighbours = 5;

% Load in scores
scoresStruct = load('RoomRecommendation\data\testScores.mat');
testScores = scoresStruct.testScores;

predictions = scorePredictor(testScores,noNeighbours);