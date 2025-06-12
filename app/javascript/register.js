document.addEventListener('DOMContentLoaded', () => {
  const taskItems = document.querySelectorAll('.task-item');
  const childItems = document.querySelectorAll('.child-item');
  const taskField = document.getElementById('task_template_id_field');
  const childField = document.getElementById('child_id_field');

  taskItems.forEach(item => {
    item.addEventListener('click', () => {
      taskItems.forEach(i => i.classList.remove('selected'));
      item.classList.add('selected');
      taskField.value = item.dataset.id;
    });
  });

  childItems.forEach(item => {
    item.addEventListener('click', () => {
      childItems.forEach(i => i.classList.remove('selected'));
      item.classList.add('selected');
      childField.value = item.dataset.id;
    });
  });
});