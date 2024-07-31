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

  document.querySelectorAll(".delete-request").forEach(function(element) {
  element.addEventListener("click", function(event) {
    event.preventDefault();
    if (confirm("Bạn có chắc chắn muốn hủy yêu cầu này?")) {
      fetch(this.href, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content")
        }
      }).then(response => {
        if (response.ok) {
          window.location.reload();
        } else {
          response.json().then(data => {
            console.error("Error:", data.errors || data.message);
            alert("Có lỗi xảy ra. Vui lòng thử lại.sss");
          });
        }
      }).catch(error => {
        console.error("Fetch error:", error);
        alert("Có lỗi xảy ra. Vui lòng thử lại.dsds");
      });
    }
  });
  });
});
