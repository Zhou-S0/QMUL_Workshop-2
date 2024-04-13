# BIO319 Workshop 2 Script Redo
# Sammi Zhou
# 12.02.2024

# Section 1.4 - Learning to commit
# Commiting is basically saving changes to a version control system VCS like GitHub
# Allows developers to track changes to their code over time, collaborate and revert to previous states if needed
# Insertations are in green, deletions are in red

# Section 2 - Regular Expressions
# Regular expressions not only allow you to look for specific characters, words or phrases, but can also look for complex text patterns

# Section 2.1 - An Introduction
# The vector for this section:
sentence <- c('By','the','time','they', 'got', 'back,', 'the', 'lights', 'were', 'all', 'out', 'and', 'everybody', 'was', 'asleep.', 'Everybody,', 'that', 'is,', 'except', 'for', 'Guih', 'Kyom', 'the', 'dung', 'beetle.', 'He', 'was', 'wide', 'awake', 'and', 'on', 'duty,', 'lying', 'on', 'his', 'back', 'with', 'his', 'legs', 'in', 'the', 'air', 'to', 'save', 'the', 'world', 'in', 'case', 'the', 'heavens', 'fell.')

# To find the word 'the' in the vector, we need to use grep() function
grep_out <- grep(pattern = 'the', x = sentence)
grep_out # It runs as numbers to display the numerical position (numberic vector) of the word 'the'
# grep_out is the variable, we are using grep() to take the word 'the' from the vector, which is the sentence
# However, it will include words that have 'the' embedded into them like 'they'

# We can check this using the grep_out to subscript our sentence using square brackets
# This will return all the words at the positions grep() gave us
sentence[grep_out]
# This basically giving the words of the numbers that they correlate to.

# If you want to avoid words like they (since the is technically there), you can do this by telling the grep() function
# This is done by adding the ^ in front of the t and $ after the e - ^the$
pattern = '^the$'
sentence[grep_out]
# These are called anchors

# Section 2.2 - Regular Expression Tools
# Regular expressions can search much more flexibly than just looking for specific words
grep_out <- grep(pattern = '[A-Z]', x = sentence)
grep_out
# Basically the [] is subscripting the setence sequence, with all the captical letters from the alphabet
# You can change it to undercase letters as well
# You can use this to search numbers as well like [0-9]
# This also gives you the numberic vector positions

# Can also use the special character '.' to specify that any character can match the search pattern
# The power of the '.' comes into play when used with other characters
# For example, if we search for 'a.e' we are looking for matches where there is an 'a' and an 'e' separated by any character.
grep_out <- grep(pattern = 'a.e', x = sentence)
sentence[grep_out]
# From thoses words, there is a letter gap between the two letters, so there is a space

# Section 2.3 - Quantifiers
# Quantifiers - Allow the user to specify how many of a character (or set of characters) grep() is matching to
# The main symbols are ?, * and +

#‘?’ denotes 0 or 1 instances.
# Examples of this would be ab?c = ac (0 instances), abc (1 instances) ane not abbc (2 instances)

# ‘*’ denotes 0 or more instances.
# Examples of this would be ab*c = ac (0 instances), abc (1 instances) or abbc (2 instances)

# ‘+’ denotes 1 or more instances
# Examples of this would be ab+c = abc (1 instances), abbc (2 instances) or abbbc (3 instances), but not ac (0 instances)

# Question 0.1 - Stop the difference
sentence[grep(pattern = 'e.?e', x = sentence)]
# It shows either two es together or two es, with a letter between them

sentence[grep(pattern = 'e.*e', x = sentence)]
# It shows the words with the letter e with 0 speces between the next e or more

sentence[grep(pattern = 'e.+e', x = sentence)]
# It shows the words with the letter e with one gap between the next e or more

# Section 2.4 - The gsub() Function
# gsub() - Used to search for text in the same way as the 'grep()' function, but instead of finding the instances of our search term, it instead substitutes the matched text with text of our choosing.
gsub_out <- gsub(pattern = 'a.e', x = sentence, replacement = '!!!')
gsub_out
# Found words with the a,gap,e and replace it with !!!

# Section 2.5 - The Challage
# Question 1 - Load in the ‘dung_beetles.csv’ into R
df <- read.csv('dung_beetles.csv')
str(df)

# Question 2 - Have a look at the structure of the dataset. What sort of dataset do you think this is
# This is a dung beetle community data set. Each row is a sample, with a count of each species in each column.

# Question 3 - Make a new object that is a vector of all the species names so we can play around with it.
cols <- colnames
cols <- colnames(df)[3:length(colnames(df))]

# Question 4 - Use your new found grep() prowess to find the names of all the species that have a genus name that starts with the letter ‘C’
C_genus <- grep(x = cols, pattern = 'C')
cols[C_genus]

# Question 4.5 - Find all the species where the specific epithet (the second word) starts with the letter ‘r’.
r_species <- grep(x = cols, pattern = '_r')
cols[r_species]

# Question 5 - There is a typo in the species names! Replace all the ‘Copis’ genus names with the correct ‘Copris’ spelling.
cols <- gsub(x = cols, pattern = 'Copis', replacement = 'Corpis')

# Question 6 - Another genus name has been misspelled - ‘Microcopis’ should be ‘Microcopris’. Fix this too.
cols <- gsub(x = cols, pattern = 'Microcopis', replacement = 'Microcopris')

# Question 8 - Now create a new gsub() command that replaces the one you used in question 5 and 6, so that it is flexible enough to fix both genus names in one go!
cols <- gsub(x = cols, pattern = 'opis', replacement = 'opris')

# Question 9 - Replace the column names in your data set with your corrected ones.
colnames(df) <- cols
colnames(df)[3:length(colnames(df))] <- cols

# Section 2.6 - Optional Super Challenge
# Question 10 - Find all the species where the genus starts with an ‘O’ and the specific epithet ends in an ‘s’
grep_out <- grep(x = cols, pattern = '^O.*s$')
cols[grep_out]

# Question 11 - Subset the dataframe so that it only contains data from months ending in a ‘y’ and genera starting with an ‘O’.
df_subsetted <- df[grep(x = df$Month, pattern = 'y$'),c(1,2,grep(x = colnames(df), pattern = '^0'))]


# BIO319 Workshop 6 Script
# Sammi Zhou
# 20.02.2024





