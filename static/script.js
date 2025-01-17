//  запрос к серверу для получения данных об инструменте
function showInstrumentInfo(instrumentName) {
    fetch(`/instrument?instrument=${encodeURIComponent(instrumentName)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Информация об инструменте не найдена");
            }
            return response.json();
        })
        .then(data => {
            const infoBlock = document.getElementById("instrument-details");
            infoBlock.innerHTML = `
                <h3>${data.name}</h3>
                <p>${data.info}</p>
            `;
            document.getElementById("instrument-info").style.display = "block";
        })
        .catch(error => {
            alert(error.message);
        });
}

//  корректность ввода в форму поиска
function validateForm() {
    const searchInput = document.getElementById('song-name').value;
    const errorMessage = document.getElementById('error-message');
    const noResultsMessage = document.getElementById('no-results');
    const resultsSection = document.getElementById('results-section');
    errorMessage.style.display = 'none';
    if (noResultsMessage) {
        noResultsMessage.style.display = 'none';
    }
    resultsSection.style.display = 'block'; 

    if (searchInput === '') {
        errorMessage.style.display = 'block';
        resultsSection.style.display = 'none'; 
        return false; 
    }

    const resultsFound = false;
    if (!resultsFound) {
        noResultsMessage.style.display = 'block'; 
        resultsSection.style.display = 'none';
    }
    return true; 
}


// позволяет выделить конкретную песню из списка.
function selectSong(songElement) {
    const songCards = document.querySelectorAll('.result-card');

    songCards.forEach(card => {
        if (card !== songElement) {
            card.classList.add('hidden');
        } else {
            card.classList.add('selected');
        }
    });

    const instrumentInfoSection = document.getElementById("instrument-info");
    instrumentInfoSection.style.display = "block";

    const instrumentDetails = document.getElementById("instrument-details");
    const instrumentId = songElement.getAttribute('data-instrument-id');

    if (instrumentId) {
        instrumentDetails.innerHTML = `Выбран инструмент с ID: ${instrumentId}`;
    } else {
        instrumentDetails.innerHTML = 'Инструмент не выбран.';
    }

    const backButton = document.getElementById("back-button");
    backButton.classList.add('visible');
}

//  отвечает за действия при нажатии на кнопку “Назад”
function goBack() {
    const instrumentInfoSection = document.getElementById("instrument-info");
    instrumentInfoSection.style.display = "none";

    const instrumentDetails = document.getElementById("instrument-details");
    instrumentDetails.innerHTML = 'Инструмент не выбран.';

    const backButton = document.getElementById("back-button");
    backButton.classList.remove('visible');

    const songCards = document.querySelectorAll('.result-card');
    songCards.forEach(card => {
        card.classList.remove('hidden', 'selected');
    });
}

//проверка поля ввода
function validateSearchInput() {
    const searchInput = document.getElementById('search-input').value;
    const errorText = document.getElementById('error-text');
    const noResultsText = document.getElementById('no-results-text');
    noResultsText.style.display = 'none';
    errorText.style.display = 'none';

    if (searchInput === '') {
        errorText.style.display = 'block';
    } else {
        const resultsFound = false; 
        if (!resultsFound) {
            noResultsText.style.display = 'block';
        }
    }
}