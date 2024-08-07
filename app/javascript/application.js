document.addEventListener('DOMContentLoaded', function() {
  var flashNotice = document.getElementById('flash_notice');
    if (flashNotice) {
      setTimeout(function() {
        flashNotice.style.display = 'none';
      }, 2000);
    }

  var toggleButton = document.getElementById('toggle-description');
  var description = document.getElementById('book-description');

  if(toggleButton && description){
    toggleButton.addEventListener('click', function() {
    if (description.classList.contains('expanded')) {
      description.classList.remove('expanded');
      toggleButton.textContent = 'Xem thêm';
    } else {
      description.classList.add('expanded');
      toggleButton.textContent = 'Thu gọn';
    }
  });
  }
});
