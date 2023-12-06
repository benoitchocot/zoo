
document.addEventListener('DOMContentLoaded', function() {
    const gameTitle =  document.getElementById('gameTitle');
    const startGameButton = document.getElementById('startGameButton');
    startGameButton.addEventListener('click', function() {

        startGameButton.classList.add('hidden');
        gameTitle.classList.add('hidden');
        fetch('/games/api/animals')
        .then(response => response.json())
        .then(animals => {
          // Mélanger les animaux pour obtenir un ordre aléatoire
          const shuffledAnimals = animals.sort(() => Math.random() - 0.5);
          // Sélectionner les 4 premiers animaux aléatoires
          const randomFourAnimals = shuffledAnimals.slice(0, 4);
              // Affichage des animaux dans animalList
              randomFourAnimals.forEach(animal => {
                const animalElement = document.createElement('p');
                animalElement.textContent = `Nom: ${animal.nom}, Espèce: ${animal.especenom}`;
                animalList.appendChild(animalElement);
              });
            })
            .catch(error => console.error('Erreur :', error));
        });
      });

      