    document.addEventListener('DOMContentLoaded', function() {
        const gameTitle =  document.getElementById('gameTitle');
        const startGameButton = document.getElementById('startGameButton');
        const animalList = document.getElementById('animalList');
        const questionDiv = document.getElementById('question');
      
        startGameButton.addEventListener('click', function() {
          // Cacher le bouton de démarrage
          startGameButton.classList.add('hidden');
      
          // Faire appel à l'API pour récupérer les animaux
          fetch('/games/api/animals')
            .then(response => response.json())
            .then(animals => {
              const shuffledAnimals = animals.sort(() => Math.random() - 0.5);
              const firstFourAnimals = shuffledAnimals.slice(0, 4);
      
              // Afficher les animaux dans animalList
              firstFourAnimals.forEach(animal => {
                const animalElement = document.createElement('div');
                animalElement.textContent = `Animal: ${animal.nom} - Espece : ${animal.especenom}`;
                animalList.appendChild(animalElement);
      
                animalElement.addEventListener('click', function() {
                  // Masquer les animaux et afficher la question
                  animalList.classList.add('hidden');
                  questionDiv.classList.remove('hidden');
                });
              });
            })
            .catch(error => console.error('Erreur :', error));
        });
      
        const submitAnswerButton = document.getElementById('submitAnswer');
        submitAnswerButton.addEventListener('click', function() {
          const selectedAnswer = document.getElementById('answers').value;
          // Traitez la réponse sélectionnée ici
          // Vous pouvez ajouter des actions en fonction de la réponse choisie
      
          // Réafficher la liste des animaux après avoir répondu à la question
          animalList.classList.remove('hidden');
          questionDiv.classList.add('hidden');
        });
      });
      