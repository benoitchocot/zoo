document.getElementById("animalForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const formData = new FormData(this);
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch('/api/animaux', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-Token': csrfToken, // Ajoutez le jeton CSRF dans les en-têtes de la requête
  },
  body: JSON.stringify(Object.fromEntries(formData)),
})
.then(response => {
  if (!response.ok) {
    throw new Error('Réponse réseau incorrecte : ' + response.status);
  }
  return response.json();
})
.then(data => {
  console.log('Animal ajouté:', data);
})
.catch(error => {
  console.error('Erreur lors de l\'ajout de l\'animal:', error);
});
  });