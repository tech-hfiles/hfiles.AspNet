const addBtn = document.getElementById('add-btn');
const inputContainer = document.getElementById('input-container');

addBtn.addEventListener('click', () => {
  // Toggle visibility (only one set of inputs)
  inputContainer.classList.toggle('hidden');
});



  document.querySelectorAll('.custom-radio input[type="radio"]').forEach((radio) => {
    radio.addEventListener('click', function () {
      if (this.checked) {
        // If already selected, store its state
        if (this.dataset.waschecked === 'true') {
          this.checked = false;
          this.dataset.waschecked = 'false';
        } else {
          // Mark this radio as selected
          document.querySelectorAll(`input[name="${this.name}"]`).forEach((r) => {
            r.dataset.waschecked = 'false';
          });
          this.dataset.waschecked = 'true';
        }
      }
    });
  });

  const modal = document.getElementById('allergyModal');
  const openBtn = document.getElementById('openAllergyModal');
  const closeBtn = modal.querySelector('button'); // Close button (×)

  openBtn.addEventListener('click', () => {
    modal.classList.remove('hidden');
  });

  closeBtn.addEventListener('click', () => {
    modal.classList.add('hidden');
  });

  // Optional: Close when clicking outside the modal content
  modal.addEventListener('click', (e) => {
    if (e.target === modal) {
      modal.classList.add('hidden');
    }
  });

  function togglePopup(show) {
    const popup = document.getElementById('medicalPopup');
    popup.classList.toggle('hidden', !show);
  }