# tamatem-tech-ass-1
This is a public repository for tamatem's first technical assignment 

# Text File Grouping Program
## Overview
This program is designed to group a collection of 1000 text files into sub-folders based on their language. Each sub-folder is named after the common language name, and it contains all the files associated with that language.

## File Naming Convention
The text files are named following a specific pattern: `[Language]-[SequenceNumber].txt`. For example, `arabic-1.txt`, `english-1.txt`, etc.

## Usage
The program can be executed from the operating system command line. It takes the following steps:

1. Automatically creates sub-folders for each unique language found in the file names.
2. Moves the text files into their respective language sub-folders.
## Before Running the Program
The folder structure before running the program typically looks like this:

> arabic-1.txt
> arabic-2.txt
> english-1.txt
> english-2.txt


## Expected Output
After running the program, the folder structure will be organized as follows:

> arabic
>> arabic-1.txt
>> arabic-2.txt
> ...
> english
>> english-1.txt
>> english-2.txt
> ...


## How to Run the Program
To execute the program, follow these steps:

1. Download the program from this [Repository](https://github.com/omarodeh95/tamatem-tech-ass-1).
1. Download the desired text files from the provided link: [Download Files](https://github.com/Tamatem-Plus/one-k-files).
2. Save the "files" in the project's folder.
3. Open a terminal or command prompt.
4. Navigate to the folder containing the program.
5. Run the program by `ruby main.rb`
	 
