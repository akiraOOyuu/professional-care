document.addEventListener("DOMContentLoaded", function () {
  let total_time = 0;
  const lectureTimes = document.querySelectorAll(".lecture_col2#lecture_time");
  const lectureFields = document.querySelectorAll(".lecture_col_field[data-field-id]");

  for (let i = 0; i < lectureTimes.length; i++) {
    const fieldId = parseInt(lectureFields[i].getAttribute("data-field-id"));
    const lectureTime = parseInt(lectureTimes[i].textContent);
 
    // field_idが2, 3, 4, 5, 8の場合のみ合計時間に加算
    if ([1, 2, 3, 4, 7].includes(fieldId)) {
      total_time += lectureTime;
    }
  }

  // 分を時:分形式の文字列に変換する関数
  function min2hour(time) {
    let hour = Math.floor(time / 60);
    let min = time % 60;

    return `${hour} 時間 ${min} 分`;
  }

  // 合計時間を表示する要素に合計値を代入
  document.getElementById("total-time").textContent = ` ${min2hour(total_time)}`;
});