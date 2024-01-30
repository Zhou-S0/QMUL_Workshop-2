# Section 2.1 - Introduction

sentence <- c('By','the','time','they', 'got', 'back,', 'the', 'lights', 'were', 'all', 'out', 'and', 'everybody', 'was', 'asleep.', 'Everybody,', 'that', 'is,', 'except', 'for', 'Guih', 'Kyom', 'the', 'dung', 'beetle.', 'He', 'was', 'wide', 'awake', 'and', 'on', 'duty,', 'lying', 'on', 'his', 'back', 'with', 'his', 'legs', 'in', 'the', 'air', 'to', 'save', 'the', 'world', 'in', 'case', 'the', 'heavens', 'fell.')
grep_out <- grep(pattern = 'the', x = sentence)
x <- sentence
pattern <- 'the'

# Basically finds out where 'the' is in a setence and gives the number location (numberic vactor) to where the word is
grep_out

# Giving any word that has 'the' in the sentence, even with word with 'the' embedded into the word
sentence[grep_out]

# the ^ and $ are called anchors
grep(pattern = '^the$')

# Section 2.2 - Regular Expression Tools
grep_out <- grep(pattern = '[A-Z]', x = sentence)
grep_out

# Looking for the lowercase
grep_out <- grep(pattern = '[a-z]', x = sentence)
grep_out

# The '.' is to specify any character can match the search pattern
grep_out <- grep(pattern = 'a.e', x = sentence)
sentence[grep_out]


# Secttion 2.3 - Quantifers
# Quantifers allow us to specify how many characters (or set of characters) grep() is matching to
# Three main symbols are ? * and +
# ?  - Denotes 0 or 1 instances
# * - Denotes 0 or more instances
# + - Denotes 1 or more instances

sentence[grep(pattern = 'e.?e', x = sentence)]
sentence[grep(pattern = 'e.*e', x = sentence)]
sentence[grep(pattern = 'e.+e', x = sentence)]

#The 


# Section 2.4 - The gsub() function
# The gsub() function can be used to search for text in the same way as the 'grep()' function, but instead of finding the instances of our search term, it instead substitutes the matched text with text of our choosing

gsub_out <- gsub(pattern = 'a.e', x = sentence, replacement = '!!!')
gsub_out

#This is an incredibly useful tool for fixing errors in datasets, when the !!! is found to see/understand where the errors are

gsub_out <- gsub(pattern = 't', x = sentence, replacement = '???')
gsub_out

# Section 2.5 - The Challenge
#2. The dataset is the amount of different dung beetle seen in different sites on different days

#3.Make a new object that is a vector of all the species names so we can play around with it.
dung_beetles <- read.csv('dung_beetles.csv')
print(dung_beetles)
species_name <- colnames(dung_beetles)
dung_beetles

#4. Find species beginning with a c
species_name[grep(pattern = 'C', x = species_name)]

#4. Find all the species where the specific epithet (the second word) starts with the letter ‘r’.
gsub_out <- grep(pattern = 'r', x = species_name)
gsub_out



