document.addEventListener('DOMContentLoaded', function() {
  var toggleButton = document.getElementById('toggle-description');
  var description = document.getElementById('book-description');

  toggleButton.addEventListener('click', function() {
    if (description.classList.contains('expanded')) {
      description.classList.remove('expanded');
      toggleButton.textContent = 'Xem thêm';
    } else {
      description.classList.add('expanded');
      toggleButton.textContent = 'Thu gọn';
    }
  });
});
