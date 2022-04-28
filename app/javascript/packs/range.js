window.addEventListener('DOMContentLoaded', () => {
  const inputElem = document.getElementById('member_skill_level');

  const currentLevelElem = document.getElementById('current_level');

  const setCurrentLevel = (val) => {
    currentLevelElem.innerText = val;
  };

  const rangeOnChange = (e) => {
    setCurrentLevel(e.target.value);
  };

  window.onload = () => {
    inputElem.addEventListener('input', rangeOnChange);
    setCurrentLevel(inputElem.value);
  };
});


