document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.getElementById('footerMenuToggle');
  const menu = document.getElementById('footerMenu');

  if (toggle && menu) {
    toggle.addEventListener('click', () => {
      menu.classList.toggle('show');
    });

    document.addEventListener('click', (e) => {
      if (!menu.contains(e.target) && !toggle.contains(e.target)) {
        menu.classList.remove('show');
      }
    });
  }
});