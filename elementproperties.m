function [mass, lambda, gam, Isat, scattXsection, threebodyloss] = elementproperties(species)
% species = handles.species1 or handles.species2
% gam is in MHz
% Isat is in W/m^2 and assumes sigma polarised light
% Note that some quantities may need to be changed, e.g. scattering length
% and threebodyloss.


amu = 1.66053873e-27;   % atomic mass unit

switch species
    
    case 'K-39'
        
        mass = 39*amu;
        lambda = 766.7e-9;
        gam = 6.035;
        Isat = 17.5;       
        scatleng = 0; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2;  %m^2
        threebodyloss = 0;  % m^6/s
        
    case 'K-40'
        
        mass = 40*amu;
        lambda = 766.7e-9;
        gam = 6.035;
        Isat = 17.5;
        scatleng = 0; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2;  %m^2
        threebodyloss = 0;  % m^6/s
        
    case 'K-41'
        
        mass = 41*amu;
        lambda = 766.7e-9;
        gam = 6.035;
        Isat = 17.5;
        scatleng = 0; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2;  %m^2
        threebodyloss = 0;  % m^6/s
        
    case 'Rb-85'
        
        mass = 85*amu;
        lambda = 780.2e-9;
        gam = 6.067;
        Isat = 16.69;
        scatleng = 0; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2;  %m^2
        threebodyloss = 0;  % m^6/s
                
    case 'Rb-87'
        
        mass = 87*amu;
        lambda = 780.2e-9;
        gam = 6.065;
        Isat = 16.69;
        scatleng = 0; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2;  %m^2
        threebodyloss = 0;  % m^6/s
        
    case 'Cs-133'
        
        mass = 133*amu;
        lambda = 852.0e-9;
        gam = 5.234; % MHz
        Isat = 11.023;        
        scatleng = 0; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2;  %m^2
        threebodyloss = 0;  % m^6/s
        
    case 'Yb-168'
        
        mass = 168*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
    case 'Yb-170'
        
        mass = 170*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
    case 'Yb-171'
        
        mass = 171*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
    case 'Yb-172'
        
        mass = 172*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
    case 'Yb-173'
                
        mass = 173*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
    case 'Yb-174'
        
        mass = 174*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
    case 'Yb-176'
        
        mass = 176*amu;
        lambda = 398.9e-9;
        gam = 28; % MHz
        Isat = 595;     
        scatleng = 104.9; % Bohr radii
        scattXsection = 8*pi*(scatleng*5.29e-11)^2; %m^2
        threebodyloss = 4.2e-41;  % m^6/s
        
end
    
