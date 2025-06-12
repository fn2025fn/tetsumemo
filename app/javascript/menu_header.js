document.addEventListener('turbo:load', () => {
  const menus = [
    { toggleId: 'menuToggleRoot', menuId: 'dropdownMenuRoot' },
    { toggleId: 'menuToggleChild', menuId: 'dropdownMenuChild' },
    { toggleId: 'menuToggleLog', menuId: 'dropdownMenuLog' }
  ];

  menus.forEach(({ toggleId, menuId }) => {
    const toggle = document.getElementById(toggleId);
    const menu = document.getElementById(menuId);

    if (toggle && menu) {
      toggle.addEventListener('click', (e) => {
        e.stopPropagation();
        menu.classList.toggle('show');
      });

      document.addEventListener('click', (e) => {
        if (!menu.contains(e.target) && !toggle.contains(e.target)) {
          menu.classList.remove('show');
        }
      });
    }
  });
});