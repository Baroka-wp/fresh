  const userInfo = document.getElementById('user-info');
  const userPopup = document.getElementById('user-popup');
  const popupCloseBtn = document.getElementById('close-popup');
  const showProfile = document.getElementById('showProfile');
  const bodyBag = document.getElementById('bodyBag');

  showProfile.addEventListener('click', () => {
    bodyBag.classList.remove('hidden');
  })

  popupCloseBtn.addEventListener('click', () => {
    userPopup.classList.toggle('hidden');
  })

  userShow.addEventListener('click', () => {
    userPopup.classList.remove('hidden');
  })
