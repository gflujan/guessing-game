# I/O Exercises 

require ('byebug'); 

# --------------------------------------------- 
# PROBLEM #01 
# * Write a `guessing_game` method. The computer should choose a number between 
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop, 
#   get a guess from the user. Print the number guessed and whether it was `too 
#   high` or `too low`. Track the number of guesses the player takes. When the 
#   player guesses the number, print out what the number was and how many guesses 
#   the player needed. 
# --------------------------------------------- 
def guessing_game() 
  # byebug 
  num_guesses = 0; 
  num_to_guess = rand(1..100); 
  # guesses = []; 

  puts "guess a number"; 
  user_guess = gets.chomp().to_i(); 
  # guesses << user_guess; 

  if user_guess > num_to_guess 
    puts "too high"; 
  else 
    puts "too low"; 
  end 

  raise NoMoreInput if user_guess == 0; 

  num_guesses += 1; 

  puts "#{user_guess}"; 
  puts "#{num_guesses}"; 
end 

# --------------------------------------------- 
# PROBLEM #02 
# * Write a program that prompts the user for a file name, reads that file, 
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You 
#   could create a random number using the Random class, or you could use the 
#   `shuffle` method in array. 
# --------------------------------------------- 
def file_shuffler() 
  puts "Please enter the name of a file."; 
  file_name = gets.chomp(); 

  # I'm not sure if the shuffling needs to happen inside of the block or outside of it 

  # VERSION 1
  # File.open(file_name) do |file| 
  #   new_file = file.shuffle(); 
  #   File.write('./"#{file_name}-shuffled.txt"', new_file) 
  # end 

  # VERSION 2
  File.open(file_name).shuffle() do |file| 
    File.write('./"#{file_name}-shuffled.txt"', file) 
  end 

  if File.file? 
    puts "File was created"; 
  else 
    puts "File was not created"; 
  end 
end 

file_shuffler(); 


# NOTES: 
# Error from VERSION 1 
# io_exercises.rb:53:in `block in file_shuffler': undefined method `shuffle' for #<File:test.txt (closed)> (NoMethodError) 
# 
# Error from VERSION 2 
# io_exercises.rb:58:in `file_shuffler': undefined method `shuffle' for #<File:test.txt> (NoMethodError)
