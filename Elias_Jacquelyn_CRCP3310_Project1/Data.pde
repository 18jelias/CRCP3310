void prepareFrequencies() {
  //Initialize array with 0s
  for (int i = 0; i < LETTERS_IN_ALPHABET; i++) {
    frequencies[i]=0;
  }
  prepareLetterFrequency();
  findWord("king");
  minChar=findMinimum(frequencies);
  maxChar=findMaximum(frequencies);
}



void prepareLetterFrequency() {
  reader = createReader(FILENAME);
  try {
    int input;
    while ((input = reader.read()) != -1) {
      if (!Character.isAlphabetic(input)) continue;
      char letter = (char)Character.toLowerCase(input);
      frequencies[letter - ASCII_OFFSET]++;
    }
    reader.close();
  } catch (IOException e) { //what?
    println("Could not read data");
    e.printStackTrace();
    noLoop();
  }  
}

void findWord(String word) {
  int sizeOfWord = word.length();
  String wordToFind = word;
  char[] matchesWord = new char[sizeOfWord];
  int counter = 0;
  int index=0;
  
  reader = createReader(FILENAME);
    try {
    int input;

    while ((input = reader.read()) != -1) {
      if (!Character.isAlphabetic(input)) continue;
      char letter = (char)Character.toLowerCase(input);
      matchesWord[index]=letter;
      counter++;
      index++;
      if ((counter%sizeOfWord)==0) {
        if (word.charAt(0)==matchesWord[0] &&
            word.charAt(1)==matchesWord[1] &&
            word.charAt(2)==matchesWord[2] &&
            word.charAt(3)==matchesWord[3] ) {
              println("test"+matchesWord[0]+matchesWord[1]+matchesWord[2]+matchesWord[3]);
              println("word"+word.charAt(0)+word.charAt(1)+word.charAt(2)+word.charAt(3));
              frequencyOfKing++;
            }
        for (int i=0;i<matchesWord.length;i++) matchesWord[i]=0;
        index=0;
      }
    }

    println("frequencyofKing"+frequencyOfKing);
    reader.close();
  } catch (IOException e) { //what?
    println("Could not read data");
    e.printStackTrace();
    noLoop();
  }

}

int findMinimum(int[] list) {
  int indexOfMin=0;
  for (int i = 0; i < LETTERS_IN_ALPHABET; i++) {
    if(frequencies[indexOfMin]>frequencies[i]) indexOfMin=i;
  }
  return (ASCII_OFFSET+indexOfMin);
}

int findMaximum(int[] list) {
  int indexOfMax=0;
  for (int i = 0; i < LETTERS_IN_ALPHABET; i++) {
    if(frequencies[indexOfMax]<frequencies[i]) indexOfMax=i;
  }
  return (ASCII_OFFSET+indexOfMax);
}

