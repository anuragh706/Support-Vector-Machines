%% file input
pt1=matfile('G:\PRML\lecture\Assignment_list\Pattern1.mat');
pt2=matfile('G:\PRML\lecture\Assignment_list\Pattern2.mat');
pt3=matfile('G:\PRML\lecture\Assignment_list\Pattern3.mat');

%% reading the 3 patterns into 3 varaibles
feat1=pt1.train_pattern_1;
feat2=pt2.train_pattern_2;
feat3=pt3.train_pattern_3;


%% creating matrix of feature vectors 

for i=1:200
    
    for k=1:120
        
        featmat1(i,k)=feat1{i}(1,k);
        featmat2(i,k)=feat2{i}(1,k);
        featmat3(i,k)=feat3{i}(1,k);
    
    
    end



end

%% concatenating the feature vectors of two different classes for svmtrain
data12=[featmat1;featmat2];
data23=[featmat2;featmat3];
data13=[featmat1;featmat3];

%% creating group variable of svmtrain function
gp1=ones(1,200);
gp1=gp1';
gp2=ones(1,200)*2;
gp2=gp2';
gp3=ones(1,200)*3;
gp3=gp3';

%% concatenating different groups for svmtrain 
gp12=[gp1;gp2];
gp23=[gp2;gp3];
gp13=[gp1;gp3];

%% using svmtrain
svmstr1=svmtrain(data12,gp12,'kernel_function','rbf','rbf_sigma',1.5);
svmstr2=svmtrain(data23,gp23,'kernel_function','rbf','rbf_sigma',1.5);
svmstr3=svmtrain(data13,gp13,'kernel_function','rbf','rbf_sigma',1.5);

%% test file input
test1=matfile('G:\PRML\lecture\Assignment_list\Test1.mat');
test2=matfile('G:\PRML\lecture\Assignment_list\Test2.mat');
test3=matfile('G:\PRML\lecture\Assignment_list\Test3.mat');

%% reading the test patterns into 3 variables
tfeat1=test1.test_pattern_1;
tfeat2=test2.test_pattern_2;
tfeat3=test3.test_pattern_3;


%%creating feature matrix

for i=1:100
    
    for k=1:120
        
        testmat1(i,k)=tfeat1{i}(1,k);
        testmat2(i,k)=tfeat2{i}(1,k);
        testmat3(i,k)=tfeat3{i}(1,k);
    
    
    end



end


%% running svmclassify


