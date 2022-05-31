%From Play to Language project
%This script is used to show the MCDI words found in the utterances
%It operates on the csv files that ruby generates, after I manually add
%the matches column!!!

%% First, load csv file: SO FAR NEED TO CHANGE IMPORT SCRIPT IF CATALINA'S WORD CHANGES! 
%Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 300);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["id_participant", "transcribe_source", "transcribe_ordinal", "transcribe_onset", "transcribe_content", "matches", "alligator", "ant", "bear", "bee", "bird", "bug", "bunny", "butterfly", "cat", "chicken", "cow", "deer", "dog", "donkey", "duck", "elephant", "fish", "frog", "giraffe", "goose", "hen", "horse", "kitty", "lamb", "lion", "monkey", "moose", "mouse", "owl", "penguin", "pig", "pony", "puppy", "rooster", "sheep", "squirrel", "teddy", "tiger", "turkey", "turtle", "wolf", "zebra", "ankle", "arm", "bellybutton", "buttock", "cheek", "chin", "ear", "eye", "face", "foot", "finger", "hair", "hand", "head", "knee", "leg", "lip", "mouth", "nose", "owie", "penis", "shoulder", "toe", "tongue", "tooth", "tummy", "vagina", "bead", "belt", "bib", "boot", "button", "coat", "diaper", "dress", "glove", "hat", "jacket", "jean", "mitten", "necklace", "pajama", "pant", "scarf", "shirt", "shoe", "shorts", "slipper", "sneaker", "snowsuit", "sock", "sweater", "tights", "underpant", "zipper", "apple", "applesauce", "banana", "bean", "bread", "butter", "cake", "candy", "carrot", "cereal", "cheerio", "cheese", "NANchicken", "chocolate", "coffee", "coke", "cookie", "corn", "cracker", "donut", "drink", "egg", "NANfish", "fries", "grape", "greenbean", "gum", "hamburger", "ice", "icecream", "jello", "jelly", "juice", "lollipop", "meat", "melon", "milk", "muffin", "noodle", "nut", "orange", "pancake", "peanutbutter", "pea", "pickle", "pizza", "popcorn", "popsicle", "potato", "potatochip", "pretzel", "pudding", "pumpkin", "raisin", "salt", "sandwich", "sauce", "soda", "soup", "spaghetti", "strawberry", "toast", "tuna", "vanilla", "vitamin", "water", "yogurt", "bathtub", "bed", "bench", "chair", "closet", "couch", "crib", "door", "drawer", "dryer", "highchair", "oven", "playpen", "potty", "refrigerator", "rockingchair", "sink", "sofa", "stair", "stove", "table", "tv", "washingmachine", "window", "flag", "flower", "grass", "hose", "ladder", "lawnmower", "rock", "roof", "sandbox", "shovel", "sidewalk", "slide", "snow", "snowman", "sprinkler", "stick", "stone", "swing", "tree", "NANwater", "basket", "blanket", "bottle", "bowl", "box", "broom", "brush", "bucket", "camera", "can", "clock", "comb", "cup", "dish", "fork", "garbage", "glass", "glasses", "hammer", "jar", "key", "knife", "lamp", "light", "medicine", "money", "mop", "nail", "napkin", "paper", "penny", "picture", "pillow", "plant", "plate", "purse", "radio", "scissors", "soap", "spoon", "tape", "telephone", "tissue", "toothbrush", "towel", "trash", "tray", "vacuum", "walker", "watch", "baabaa", "choochoo", "cockadoodledoo", "meow", "moo", "quackquack", "vroom", "woofwoof", "ball", "balloon", "bat", "block", "book", "bubble", "chalk", "crayon", "doll", "glue", "pen", "pencil", "playdough", "puzzle", "airplane", "bicycle", "boat", "bus", "car", "firetruck", "helicopter", "motorcycle", "sled", "stroller", "tractor", "train", "tricycle", "truck"];
opts.VariableTypes = ["double", "categorical", "double", "double", "categorical", "double", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["transcribe_source", "transcribe_content", "alligator", "ant", "bear", "bee", "bird", "bug", "bunny", "butterfly", "cat", "chicken", "cow", "deer", "dog", "donkey", "duck", "elephant", "fish", "frog", "giraffe", "goose", "hen", "horse", "kitty", "lamb", "lion", "monkey", "moose", "mouse", "owl", "penguin", "pig", "pony", "puppy", "rooster", "sheep", "squirrel", "teddy", "tiger", "turkey", "turtle", "wolf", "zebra", "ankle", "arm", "bellybutton", "buttock", "cheek", "chin", "ear", "eye", "face", "foot", "finger", "hair", "hand", "head", "knee", "leg", "lip", "mouth", "nose", "owie", "penis", "shoulder", "toe", "tongue", "tooth", "tummy", "vagina", "bead", "belt", "bib", "boot", "button", "coat", "diaper", "dress", "glove", "hat", "jacket", "jean", "mitten", "necklace", "pajama", "pant", "scarf", "shirt", "shoe", "shorts", "slipper", "sneaker", "snowsuit", "sock", "sweater", "tights", "underpant", "zipper", "apple", "applesauce", "banana", "bean", "bread", "butter", "cake", "candy", "carrot", "cereal", "cheerio", "cheese", "NANchicken", "chocolate", "coffee", "coke", "cookie", "corn", "cracker", "donut", "drink", "egg", "NANfish", "fries", "grape", "greenbean", "gum", "hamburger", "ice", "icecream", "jello", "jelly", "juice", "lollipop", "meat", "melon", "milk", "muffin", "noodle", "nut", "orange", "pancake", "peanutbutter", "pea", "pickle", "pizza", "popcorn", "popsicle", "potato", "potatochip", "pretzel", "pudding", "pumpkin", "raisin", "salt", "sandwich", "sauce", "soda", "soup", "spaghetti", "strawberry", "toast", "tuna", "vanilla", "vitamin", "water", "yogurt", "bathtub", "bed", "bench", "chair", "closet", "couch", "crib", "door", "drawer", "dryer", "highchair", "oven", "playpen", "potty", "refrigerator", "rockingchair", "sink", "sofa", "stair", "stove", "table", "tv", "washingmachine", "window", "flag", "flower", "grass", "hose", "ladder", "lawnmower", "rock", "roof", "sandbox", "shovel", "sidewalk", "slide", "snow", "snowman", "sprinkler", "stick", "stone", "swing", "tree", "NANwater", "basket", "blanket", "bottle", "bowl", "box", "broom", "brush", "bucket", "camera", "can", "clock", "comb", "cup", "dish", "fork", "garbage", "glass", "glasses", "hammer", "jar", "key", "knife", "lamp", "light", "medicine", "money", "mop", "nail", "napkin", "paper", "penny", "picture", "pillow", "plant", "plate", "purse", "radio", "scissors", "soap", "spoon", "tape", "telephone", "tissue", "toothbrush", "towel", "trash", "tray", "vacuum", "walker", "watch", "baabaa", "choochoo", "cockadoodledoo", "meow", "moo", "quackquack", "vroom", "woofwoof", "ball", "balloon", "bat", "block", "book", "bubble", "chalk", "crayon", "doll", "glue", "pen", "pencil", "playdough", "puzzle", "airplane", "bicycle", "boat", "bus", "car", "firetruck", "helicopter", "motorcycle", "sled", "stroller", "tractor", "train", "tricycle", "truck"], "EmptyFieldRule", "auto");

% Import the data
data0 = readtable("/Users/cs6109/Desktop/Data_fromDatavyu_2020-03-12.csv", opts);

words = opts.VariableNames(7:300);
column_names = opts.VariableNames(1:300);
clear opts


%% Second, find the words found in each utterances

%create vector with subjects
subjects = table2array(data0(:,1));

%create vector with all the results: trues and falses
data1 = table2array(data0(:,7:size(data0,2)));

%turn true and false to numbers: true=2 and false=1
data1 = double(data1);

%concatenate subjects and data1
data2 = [subjects data1];

%create structure with all words found as the columns
for i = 1:size(data2,1)
    thisrow=data2(i,2:size(data2,2));
    true_indices=find(thisrow==2);
    result_word(i,1:size(true_indices,2)) = words(true_indices);
    true_indices=[];
end

%concatenate to generate final script that coders will use to check
output=[data0(:,1:5) result_word data0(:,6:size(data0,2))];

%rename columns with words
output.Properties.VariableNames([6:10]) = {'Word 1' 'Word 2' 'Word 3' 'Word 4' 'Word 5'};

%create empty variables for the mistakes
mistake_word1 = NaN(size(output,1),1);
mistake_word2 = NaN(size(output,1),1);
mistake_word3 = NaN(size(output,1),1);
mistake_word4 = NaN(size(output,1),1);
mistake_word5 = NaN(size(output,1),1);

%add mistake for words
output = addvars(output,mistake_word1,'Before','Word 2');
output = addvars(output,mistake_word2,'Before','Word 3');
output = addvars(output,mistake_word3,'Before','Word 4');
output = addvars(output,mistake_word4,'Before','Word 5');
output = addvars(output,mistake_word5,'Before','matches');

%Print csv for coders the whole subjects! YAY
writetable(output,"Data_FromMatlab_2020-03-12.csv")

%Print each subject's csv separate
participants_id=sortrows(unique(output(:,1)));

for j = 1:size(participants_id,1)
    thisparticipant=participants_id(j,1);
    thisparticipant=table2array(thisparticipant);
    rows=output.id_participant==thisparticipant;
    thisdata=output(rows,:);
    writetable(thisdata,sprintf('LEGO_S#0%d.xlsx',thisparticipant));
    thisdata=[];
end