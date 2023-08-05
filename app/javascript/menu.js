function pullDown() {
  const pullDownButton = document.getElementById("hamburger-btn");
  const pullDownParents = document.getElementById("pull-down");
  

  pullDownButton.addEventListener('click', function() {
    event.preventDefault(); // デフォルトの挙動をキャンセル
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }
  });
}

window.addEventListener('load', pullDown);