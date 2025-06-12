document.addEventListener('DOMContentLoaded', () => {
  const childIcons = document.querySelectorAll('.child-icon');
  const hiddenInput = document.getElementById('selected_child_id');

  childIcons.forEach(icon => {
    icon.addEventListener('click', () => {
      
      childIcons.forEach(i => i.classList.remove('selected'));

      
      icon.classList.add('selected');

      
      hiddenInput.value = icon.dataset.childId;
    });
  });
});