var _urlImgIconsSvg = require('url:../img/icons.svg');
var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
var _urlImgIconsSvgDefault = _parcelHelpers.interopDefault(_urlImgIconsSvg);
const recipeContainer = document.querySelector('.recipe');
const timeout = function (s) {
  return new Promise(function (_, reject) {
    setTimeout(function () {
      reject(new Error(`Request took too long! Timeout after ${s} second`));
    }, s * 1000);
  });
};
// https://forkify-api.herokuapp.com/v2
const showRecipe = async function () {
  try {
    const res = await fetch('https://forkify-api.herokuapp.com/api/v2/recipes/5ed6604591c37cdc054bcc40');
    const data = await res.json();
    console.log(data);
    if (!res.ok) throw new Error(`${data.message} (${res.status})`);
    const markup = `
            <figure class="recipe__fig">
            <img src="${data.data.recipe.image_url}" alt="${data.data.recipe.title}" class="recipe__img" />
            <h1 class="recipe__title">
              <span>${data.data.recipe.title}</span>
            </h1>
          </figure>

          <div class="recipe__details">
            <div class="recipe__info">
              <svg class="recipe__info-icon">
                <use href="${_urlImgIconsSvgDefault.default}#icon-clock"></use>
              </svg>
              <span class="recipe__info-data recipe__info-data--minutes">${data.data.recipe.cooking_time}</span>
              <span class="recipe__info-text">minutes</span>
            </div>
            <div class="recipe__info">
              <svg class="recipe__info-icon">
                <use href="${_urlImgIconsSvgDefault.default}#icon-users"></use>
              </svg>
              <span class="recipe__info-data recipe__info-data--people">${data.data.recipe.servings}</span>
              <span class="recipe__info-text">servings</span>

              <div class="recipe__info-buttons">
                <button class="btn--tiny btn--increase-servings">
                  <svg>
                    <use href="${_urlImgIconsSvgDefault.default}#icon-minus-circle"></use>
                  </svg>
                </button>
                <button class="btn--tiny btn--increase-servings">
                  <svg>
                    <use href="${_urlImgIconsSvgDefault.default}#icon-plus-circle"></use>
                  </svg>
                </button>
              </div>
            </div>

            <div class="recipe__user-generated">
              <svg>
                <use href="${_urlImgIconsSvgDefault.default}#icon-user"></use>
              </svg>
            </div>
            <button class="btn--round">
              <svg class="">
                <use href="${_urlImgIconsSvgDefault.default}#icon-bookmark-fill"></use>
              </svg>
            </button>
          </div>

          <div class="recipe__ingredients">
            <h2 class="heading--2">Recipe ingredients</h2>
            <ul class="recipe__ingredient-list">
            ${data.data.recipe.ingredients.map(ing => {
      return `<li class="recipe__ingredient">
              <svg class="recipe__icon">
                <use href="${_urlImgIconsSvgDefault.default}#icon-check"></use>
              </svg>
              <div class="recipe__quantity">${ing.quantity}</div>
              <div class="recipe__description">
                <span class="recipe__unit">${ing.unit}</span>
                ${ing.description}
              </div>
            </li>`;
    }).join('')}
            </ul> 
          </div>

          <div class="recipe__directions">
            <h2 class="heading--2">How to cook it</h2>
            <p class="recipe__directions-text">
              This recipe was carefully designed and tested by
              <span class="recipe__publisher">${data.data.recipe.publisher}</span>. Please check out
              directions at their website.
            </p>
            <a
              class="btn--small recipe__btn"
              href="${data.data.recipe.source_url}"
              target="_blank"
            >
              <span>Directions</span>
              <svg class="search__icon">
                <use href="${_urlImgIconsSvgDefault.default}#icon-arrow-right"></use>
              </svg>
            </a>
          </div>
  `;
    recipeContainer.innerHTML = '';
    recipeContainer.insertAdjacentHTML('afterbegin', markup);
  } catch (err) {
    alert(err);
  }
};
showRecipe();
