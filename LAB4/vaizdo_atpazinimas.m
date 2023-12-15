close all
clear all
clc
%% Raidziu pavyzdzio nuskaitymas ir pozymio skaiciavimas
% read the image with hand-written characters

pavadinimas = 'train_data3.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 4);

%% Atpazinimo kurimas
% Development of character recognizer
% take the features from cell-type variable and save into a matrix-type variable

P = cell2mat(pozymiai_tinklo_mokymui);

% create the matrices of correct answers for each line (number of matrices
% = number of symbol lines)

T = [eye(7), eye(7), eye(7), eye(7)];

% create an RBF network for classification with 13 neurons, and sigma = 1
% (P ir T sarysiams)

tinklas = newrb(P,T,0,1,40);

%% Tinklo patikra | Test of the network (recognizer)
% estimate output of the network for unknown symbols (row, that were not used during training)

P2 = P(:,12:21);
Y2 = sim(tinklas, P2);

% find which neural network output gives maximum value

[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row( pozymio P2 stulpelio
% skaixiu)

raidziu_sk = size(P2,2);

% we will save the result in variable 'atsakymas'

atsakymas = [];

for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas = [atsakymas, 'T'];
        case 2
            atsakymas = [atsakymas, 'H'];
        case 3
            atsakymas = [atsakymas, 'I'];
        case 4
            atsakymas = [atsakymas, 'S'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'E'];
        case 7
            atsakymas = [atsakymas, 'A'];
    end
end

% show the result in command window

disp(atsakymas)

% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% Extract features of the test image

pavadinimas = 'test_data3.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidziu atpazinimas
% Perform letter/symbol recognition
% features from cell-variable are stored to matrix-variable

P2 = cell2mat(pozymiai_patikrai);

% estimating neuran network output for newly estimated features

Y2 = sim(tinklas, P2);

% searching which output gives maximum value

[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% calculating number of symbols - number of columns (pozymio P2 stulpelio
% skaiciu)

raidziu_sk = size(P2,2);

% rezultatà saugosime kintamajame 'atsakymas'
atsakymas = [];

for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'T'];
        case 2
            atsakymas = [atsakymas, 'H'];
        case 3
            atsakymas = [atsakymas, 'I'];
        case 4
            atsakymas = [atsakymas, 'S'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'E'];
        case 7
            atsakymas = [atsakymas, 'A'];
    end
end

disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off