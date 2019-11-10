% This script is for the Cyxtera Data Analysis Challenge for HackUTD 2019.
% This script uses an open source .csv file that contains health information
% logged by a health/activity tracker. The file was modified to contain
% only integer and string data types.

% Start of program: Read csv file
file1 = importdata('Health.csv');
% Ask for input:
% Do you want to compare more than one data type graphically?
    % How many do you want to compare?
        % Which ones do you want to compare?
% Do you want to see the graphical representation of one data type?
    % Which data type do you want to see?
% Do you want to see the full data analysis of one data type?
    % Which data type do you want to analyze?
dataType= [0 0 0 0 0 0];
color = ['r-' 'g-' 'b-' 'p-' 'c-' 'm-'];
start = 0;
while start == 0
userInput = input('Do you want to compare more than one data type graphically? Input 1 for yes.\nDo you want to see the graphical representation of one data type? Input 2 for yes.\nDo you want to see the full data analysis of one data type? Input 3 for yes.\nEnter -1 to exit.\n');
switch userInput
    case 1
        num_compare = input('How many do you want to compare? Pick a number from 2 to 6. ');
        for k = 1:num_compare
            fprintf('Pick a data type to compare.\n');
            choice1 = input('1) Step Count\n2) Mood\n3) Calories Burned\n4) Hours of Sleep\n5) Activeness\n6) Weight in kg\n');
            fprintf('You chose %d\n', choice1);
            dataType(k) = choice1 + 1;
        end
        for p = 1: num_compare
            subplot(3,2,p);
            plot(file1.data(:,1), file1.data(:,dataType(p)), color(p));   
            xlabel('Days from Jan 01');
            ylabel(file1.textdata(1,dataType(p))); 
        end
    case 2
        choice2 = input('Which data type do you want to see?\n1) Step Count\n2) Mood\n3) Calories Burned\n4) Hours of Sleep\n5) Activeness\n6) Weight in kg\n');
        fprintf('You chose %d\n', choice2);
        plot(file1.data(:,1), file1.data(:,choice2+1), color(choice2+1));
        xlabel('Days from Jan 01');
        ylabel(file1.textdata(1,choice2+1)); 
    case 3
        choice3 = input('Which data type do you want to see?\n1) Step Count\n2) Mood\n3) Calories Burned\n4) Hours of Sleep\n5) Activeness\n6) Weight in kg\n');
        switch choice3
            case 1 % Step Count
                % standard deviation
                dev1 = std(file1.data(:,choice3+1));
                fprintf('The standard deviation of the Step Count data is %.3f\n', dev1);
                % mean per day
                mean1 = (sum(file1.data(:,choice3+1)))/96 ;
                fprintf('The mean steps per day is %d\n', mean1);
                % maximum
                max1 = 0;
                for b = 1:96
                    if(max1 < file1.data(b, choice3+1))
                        max1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The maximum number of steps in a day is %d\n', max1);
                % minimum
                min1 = 1000;
                for c = 1:96
                    if(min1 > file1.data(b, choice3+1))
                        min1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The minimum number of steps in a day is %d\n', min1);
            case 2 % Mood
                % frequency
                HappyN = 0;
                NeutralN = 0; 
                SadN = 0;
                for r = 1:96
                    
                    if file1.data(r,choice3+1) == 300
                    HappyN = HappyN+1;
                    end
                     if file1.data(r,choice3+1) == 200
                    NeutralN = NeutralN+1;
                     end
                       if file1.data(r,choice3+1) == 100
                    SadN = SadN + 1;
                       end
                end
                % Happy = 300
                fprintf('The person was happy %d days \n', HappyN);
                % Neutral = 200
                fprintf('The person was neutral %d days \n', NeutralN);
                % Sad = 100
                fprintf('The person was sad %d days \n', SadN);
            case 3 % Calories Burned
                % standard deviation
                dev1 = std(file1.data(:,choice3+1));
                fprintf('The standard deviation of the Calories Burned data is %.3f\n', dev1);
                % mean per day
                mean1 = (sum(file1.data(:,choice3+1)))/96 ;
                fprintf('The mean steps per day is %d\n', mean1);
                % maximum
                max1 = 0;
                for b = 1:96
                    if(max1 < file1.data(b, choice3+1))
                        max1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The maximum number of calories burned is %d\n', max1);
                % minimum
                min1 = 1000;
                for c = 1:96
                    if(min1 > file1.data(b, choice3+1))
                        min1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The minimum number of calories burned is %d\n', min1);
            case 4 % Hours of Sleep
                % standard deviation
                dev1 = std(file1.data(:,choice3+1));
                fprintf('The standard deviation of the Hours of Sleep data is %.3f\n', dev1);
                % mean per day
                mean1 = (sum(file1.data(:,choice3+1)))/96 ;
                fprintf('The mean hours of sleep per day is %d\n', mean1);
                % maximum
                max1 = 0;
                for b = 1:96
                    if(max1 < file1.data(b, choice3+1))
                        max1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The maximum hours slept is %d\n', max1);
                % minimum
                min1 = 1000;
                for c = 1:96
                    if(min1 > file1.data(b, choice3+1))
                        min1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The minimum hours slept is %d\n', min1);
            case 5 % Activeness
                % Frequency (not active vs active)
                ActiveN = 0;
                NoActiveN = 0; 
                for r = 1:96
                    if file1.data(r,choice3+1) == 300
                        ActiveN = ActiveN+1;
                    end
                    if file1.data(r,choice3+1) == 200
                        NoActiveN = NoActiveN+1;
                    end
                end
                fprintf('The person felt active %d days \n', ActiveN);
                fprintf('The person did not feel active %d days \n', NoActiveN);
                % more active or not
                if ActiveN > NoActiveN
                    fprintf('This person felt more active overall\n');
                else
                    fprintf('This person felt inactive overall\n');
                end
            case 6 % Weight in kg
                % standard deviation
                dev1 = std(file1.data(:,choice3+1));
                fprintf('The standard deviation of the Weight data is %.3f\n', dev1);
                % maximum
                max1 = 0;
                for b = 1:96
                    if(max1 < file1.data(b, choice3+1))
                        max1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The maximum weight is %d\n', max1);
                % minimum
                min1 = 1000;
                for c = 1:96
                    if(min1 > file1.data(b, choice3+1))
                        min1 = file1.data(b, choice3+1);
                    end
                end
                fprintf('The minimum weight is %d\n', min1);
                % overall loss/gain = last - first
                fprintf('The overall loss/gain is %d\n',file1.data(96, choice3+1)-file1.data(1, choice3+1));
        end
    otherwise
        fprintf('Exiting program')
        start = -1;
 end
end


