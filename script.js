document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('employeeSearch');
    const displayLabel = document.getElementById('searchQueryDisplay');


    searchInput.addEventListener('keyup', function() {
        const val = this.value;
     
        displayLabel.innerHTML = val; 
    });
});