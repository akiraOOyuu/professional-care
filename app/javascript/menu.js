document.addEventListener('DOMContentLoaded', function() {
  const hamburgerButton = document.getElementById('hamburger-btn');
  const closeButton = document.getElementById('hamburger-close-btn');
  const pullDownMenu = document.getElementById('pull-down');
  
  hamburgerButton.addEventListener('click', function() {
    event.preventDefault(); // デフォルトの挙動をキャンセル
    pullDownMenu.style.display = 'block';
    hamburgerButton.style.display = 'none';
    closeButton.style.display = 'block';
  });

  closeButton.addEventListener('click', function() {
    pullDownMenu.style.display = 'none';
    closeButton.style.display = 'none';
    hamburgerButton.style.display = 'block';
  });
});
