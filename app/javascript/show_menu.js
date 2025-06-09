document.addEventListener('DOMContentLoaded', () => {
  const toggleButton = document.getElementById('menuToggle');
  const menu = document.getElementById('dropupMenu');

  if (toggleButton && menu) {
    toggleButton.addEventListener('click', () => {
      menu.classList.toggle('show');
    });

    document.addEventListener('click', (e) => {
      if (!menu.contains(e.target) && !toggleButton.contains(e.target)) {
        menu.classList.remove('show');
      }
    });
  }
});