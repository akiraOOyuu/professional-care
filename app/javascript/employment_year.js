document.addEventListener("DOMContentLoaded", function () {
  // 就業日と現在の日付を取得
  const employmentDateStr = document.getElementById("employmentDate").getAttribute("data-employment");
  const employmentDate = new Date(employmentDateStr);
  const currentDate = new Date();

  // 経過月数の計算
  const yearsDiff = currentDate.getFullYear() - employmentDate.getFullYear();
  const monthsDiff = currentDate.getMonth() - employmentDate.getMonth();
  const totalMonthsDiff = yearsDiff * 12 + monthsDiff;

    // 年数と月数に分ける
  const years = Math.floor(totalMonthsDiff / 12);
  const months = totalMonthsDiff % 12;

  // 表示する文字列を作成
  let displayString = '';
  if (years > 0) {
    displayString += years + '年';
  }
  if (months > 0) {
    displayString += (months - 1) + 'カ月';
  }
  document.getElementById("total_year").textContent = displayString;
});