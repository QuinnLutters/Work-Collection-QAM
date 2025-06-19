const cardNames = ["Organ", "Lab", "Root", "Horseshoe", "War", "Theater", "Alps", "Heart", "Torch", "China","Band", "March", "Ham", "Tooth", "Force", "Tick", "Circle", "Row", "Teacher", "Hawk","Limousine", "New York", "Fly", "Stadium", "Bermuda"];       

        // creates all elements for the starting screen of the game
        const startMenu = document.createElement("div");
        const intro = document.createElement("h1");
        const startBtn = document.createElement("button");
        const rulesBtn = document.createElement("button");

        // adds text to all the elements
        intro.textContent = ("Hello, welcome to codenames a game created by Quinn Lutters only using javascript and css. Have fun!!");
        startBtn.textContent = ("Start game");
        rulesBtn.textContent = ("Game rules");

        // adds the element to the div and adds the div to the body
        startMenu.appendChild(intro);
        startMenu.appendChild(startBtn);
        // startMenu.appendChild(rulesBtn);

        document.body.appendChild(startMenu);

        startMenu.classList.add("startMenu")
    
        // adds class to the div 
        function hideStartMenu() {
            startMenu.classList.add("hide");
        }
        // adds an eventlistener to the start button, which then calls two functions to create the gamecards and to hide the start menu
        startBtn.addEventListener("click", function() {
            createGame();
            hideStartMenu();
        });



        //function to shuffle the array in order to be able ro randomize the order and names of the cards
        function shuffleArray(array){
            let shuffledArray = [];
            let shuffledWords = [];

            // while loop which shuffles array, which checks if the shuffled array lenghts is shorter. if so it continues the loop if not it stops
            while (shuffledArray.length < array.length) {

                // calculates random numbers, with math flor to create round numbers.
                let arrayNumber = Math.floor(Math.random() * array.length);

                // checks if the word doesn't have an assigned number, if so it pushes a number/word into the array
                if(!shuffledWords.includes(arrayNumber)){
                    shuffledArray.push(array[arrayNumber]);
                    shuffledWords.push(arrayNumber);
                }
            }
            return shuffledArray;
        }

        function assignColors() {
            let cardNumbers = [];
            let usedCardNumbers = [];
          
            // creates 9 random Numbers
            while (cardNumbers.length < 9) {
              const randomNumber = Math.floor(Math.random() * 25);
          
              if (!usedCardNumbers.includes(randomNumber)) {
                cardNumbers.push(randomNumber);
                usedCardNumbers.push(randomNumber);
              }
            }
          
            // adds class blue to 4 random cards
            for (let i = 0; i < 4; i++) {
              const cardIndex = cardNumbers[i];
              const cardClass = "card" + cardIndex;
              const cardElement = document.querySelector("." + cardClass);
          
              if (cardElement) {
                cardElement.addEventListener("click", function(){
                    cardElement.classList.add("blue");

                })
              }
            }
          
            // adds class red to 4 random cards
            for (let i = 4; i < 8; i++) {
              const cardIndex = cardNumbers[i];
              const cardClass = "card" + cardIndex;
              const cardElement = document.querySelector("." + cardClass);
          
              if (cardElement) {
                cardElement.addEventListener("click", function(){
                    cardElement.classList.add("red");

                })
              }
            }
          
            // adds class black to 1 random card
            const blackCardIndex = cardNumbers[8];
            const blackCardClass = "card" + blackCardIndex;
            const blackCardElement = document.querySelector("." + blackCardClass);
          
            if (blackCardElement) {
                blackCardElement.addEventListener("click", function(){
                    blackCardElement.classList.add("black");

                })
            }

            // assigns class clicked to all other cards
            const cards = document.querySelectorAll('.game button');
            cards.forEach(card => {
              card.addEventListener('click', function () {
                if (!card.classList.contains('red') && !card.classList.contains('blue') && !card.classList.contains('black')) {
                    card.classList.add('clicked');
                    const childElements = card.querySelectorAll('p, div');
                    childElements.forEach(child => {
                        child.remove();
                    });

                } else if (card.classList.contains('red') || card.classList.contains('blue') || card.classList.contains('black')) {
                    const childElements = card.querySelectorAll('p, div');
                    childElements.forEach(child => {
                        child.remove();
                    });
                }
              });
            });
          

            
        }

        
        





        // function to create the elements needed for the game
        function createGame(){

            // creates topmenu for quitting the game and reading rules
            const topMenu = document.createElement("div");
            const quitBtn = document.createElement("button");
            const rulesBtn = document.createElement("button");

            // adds text to teh buttons
            quitBtn.textContent = ("Quit");
            rulesBtn.textContent = ("Game rules");

            // adds the element to the div and adds the div to the body
            topMenu.appendChild(quitBtn);
            topMenu.appendChild(rulesBtn);
            document.body.appendChild(topMenu);

            // adds class to the div 
            rulesBtn.classList.add("hide")
            topMenu.classList.add("topMenu");

            // function to remove the c;lasslist hide
            function quitGame(){
                startMenu.classList.remove("hide")
            }
            // function to clear all of the elements created for the game
            function removeGame(){
                gameDiv.remove();
                topMenu.remove();
            }

            // adds function to the button by an eventlistener which calls the functions to go back to the start screen
            quitBtn.addEventListener("click", function(){
                quitGame();
                removeGame()
            });

            // constant to create a variable which i can use to assign words to the cards
            const shuffledNames = shuffleArray(cardNames);

            // creates a div for the game cards
            const gameDiv = document.createElement("div");

            // adds the div to the document and all of it's content
            document.body.appendChild(gameDiv);

            gameDiv.classList.add("game");

            // makes sure the code in the for loop runs 25 times for 25 cards
            for (let i = 0; i < 25; i++){

                // creates every element which I need
                const cardDiv = document.createElement("button");
                const word180P = document.createElement("p");
                const wordBreak = document.createElement("div");
                const wordP = document.createElement("p");

                // adds words to each part, usign i to assign the next word in the array 
                wordP.textContent = shuffledNames[i];
                word180P.textContent = shuffledNames[i];

                // adds all the elements into the gameDiv and add all other elemnts together
                cardDiv.appendChild(word180P);
                cardDiv.appendChild(wordBreak);
                cardDiv.appendChild(wordP);
                gameDiv.appendChild(cardDiv);

                // adds classes to the cards, for later styling
                cardDiv.classList.add(`card${i}`); 
                wordP.classList.add("normal");
                word180P.classList.add("upside-down");
                wordBreak.classList.add("break");
                   

            }
            assignColors();
           
        }