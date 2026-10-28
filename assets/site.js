const menuToggle = document.querySelector('.nav-toggle');
const mainNav = document.querySelector('.main-nav');

if (menuToggle && mainNav) {
  menuToggle.addEventListener('click', () => {
    const isOpen = menuToggle.getAttribute('aria-expanded') === 'true';
    menuToggle.setAttribute('aria-expanded', String(!isOpen));
    menuToggle.setAttribute('aria-label', isOpen ? 'Abrir menú' : 'Cerrar menú');
    mainNav.classList.toggle('is-open', !isOpen);
  });

  mainNav.addEventListener('click', (event) => {
    if (event.target.closest('a')) {
      menuToggle.setAttribute('aria-expanded', 'false');
      menuToggle.setAttribute('aria-label', 'Abrir menú');
      mainNav.classList.remove('is-open');
    }
  });
}

const orderForm = document.querySelector('.order-form');
const productSelect = document.querySelector('#product-select');
const quantityInput = document.querySelector('#quantity');
const totalOutput = document.querySelector('.order-total b');
const prices = {
  'smash-clasica': 18.9,
  'doble-bacon': 25.9,
  'crispy-pollo': 20.9,
  'papas-urbanas': 10.9,
};

function updateOrderTotal() {
  if (!productSelect || !quantityInput || !totalOutput) return;
  const price = prices[productSelect.value] || 0;
  const quantity = Math.min(10, Math.max(1, Number(quantityInput.value) || 1));
  totalOutput.textContent = `S/ ${(price * quantity).toFixed(2)}`;
}

if (orderForm && productSelect && quantityInput) {
  productSelect.addEventListener('change', updateOrderTotal);
  quantityInput.addEventListener('input', updateOrderTotal);
  orderForm.addEventListener('submit', (event) => {
    if (!orderForm.reportValidity()) event.preventDefault();
  });
  document.querySelectorAll('[data-product]').forEach((link) => {
    link.addEventListener('click', () => {
      productSelect.value = link.dataset.product;
      updateOrderTotal();
    });
  });
}
