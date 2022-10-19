/*
* Fonction de recherche et filtre du tableau
* auteur : Florian Rousseau, SIO2-2021-2022
*/

function search_rp() {
    // Déclaration des variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("search_rp"); //
    filter = input.value.toUpperCase();

    tbody = document.getElementById("tbody_rp");
    tr = tbody.getElementsByTagName("tr");


    // Boucle sur les lignes du tableau
    for (i = 0; i < tr.length; i++) {
        colonneNom = tr[i].getElementsByTagName("td")[0]; //get la cellule de la colonne nom sur la ligne n
        colonneLibelle = tr[i].getElementsByTagName("td")[2]; //get la cellule de la colonne libelle sur la ligne n
        
        //alert(tr[i].getElementsByTagName("td")[0].textContent);
        if (colonneNom || colonneLibelle) {
          nom = colonneNom.textContent || colonneNom.innerText; //Get la valeur de la cellule nom
          libelle = colonneLibelle.textContent || colonneLibelle.innerText; //Get la valeur de la cellule libelle
  
  
          //On regarde si la ligne contient une des deux valeurs
          if ((nom.toUpperCase().indexOf(filter) > -1) ||  libelle.toUpperCase().indexOf(filter) > -1) { // Si oui on l'affiche
            tr[i].style.display = "";
          } else { // Sinon on ne l'affiche pas
            tr[i].style.display = "none";
          }
        }
      
     

      

    
    
    
    }


  }