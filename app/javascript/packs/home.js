  var userShow = document.getElementById('userShow');
  var url = "http://localhost:3000/homes"
  var scrollLeft = document.getElementById('scroll-left')
  var scrollRight = document.getElementById('scroll-right')
  var userinfo = document.getElementById('user-info')
  var popupCloseBtn = document.getElementById('close-popup');
  var userPopup = document.getElementById('user-popup');

  loadUser(0);
  async function getUser() {
        const resp =  await fetch(url);
        const respData = await resp.json();
        //const randomMeal = respData.meals[0];
        return respData
    }

async function loadUser(e) {
    await afficherUser(e)
    return e++
  }

async function afficherUser(e) {
    var respData =  await getUser()
    var user = respData[e]
    userShow.innerHTML = `
      <img id="userProfile" src=${user.profil.url}>
      <div class=" userDetail">
      <div>
        <h3 id="userName">${user.name}</h3>
        <p id="userSexe">${user.sexe}</p>
      </div>
      <div class="user-body ">
        <button class="fav-btn">
          <i class="fas fa-heart active"> 50 %</i>
        </button>
      </div>
    </div>
`;
  }

  var currentdata = 0

  scrollLeft.addEventListener('click', async () => {
    currentdata++
    var respData =  await getUser()
    if (currentdata < respData.length){
      loadUser(currentdata);
    }
    if (currentdata >= respData.length){
      userShow.innerHTML = `
        <p> Vous avez tout vu pour le moment </p>
  `;
    }
    console.log(currentdata)
  })


  scrollRight.addEventListener('click', async () => {
    var respData =  await getUser()
    currentdata++
    if (currentdata < respData.length){
      loadUser(currentdata);
    }
    if (currentdata >= respData.length){
      userShow.innerHTML = `
        <p> Vous avez tout vu pour le moment </p>
  `;
    }

    console.log(currentdata)
  })

  userShow.addEventListener('click', async () => {
    var respData =  await getUser()
    var user = respData[currentdata]
    userPopup.classList.toggle('hidden');
    userinfo.innerHTML =
      `<div class="user-info" id="user-info">
      <img id="userProfile" src=${user.profil.url}>
          <div class=" userDetail">
            <div>
              <h3 id="userName">${user.name}</h3>
              <p id="userSexe">${user.sexe}</p>
            </div>
            <br>
          <div class="user-body ">
            <button class="fav-btn">
              <i class="fas fa-heart active"> 50 %</i>
            </button>
          </div>
        </div>
      <div class="userBio">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
          Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
      </div>
    </div>`
  })
  
  popupCloseBtn.addEventListener('click', () => {
  userPopup.classList.toggle('hidden');
})
