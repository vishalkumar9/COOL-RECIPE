var _modelJs = require('./model.js');
var _viewsRecipeViewsJs = require('./views/recipeViews.js');
var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
var _viewsRecipeViewsJsDefault = _parcelHelpers.interopDefault(_viewsRecipeViewsJs);
var _viewsSearchViewJs = require('./views/searchView.js');
var _viewsSearchViewJsDefault = _parcelHelpers.interopDefault(_viewsSearchViewJs);
var _viewsResultsViewJs = require('./views/resultsView.js');
var _viewsResultsViewJsDefault = _parcelHelpers.interopDefault(_viewsResultsViewJs);
require('core-js/stable');
require('regenerator-runtime/runtime');
const controlRecipes = async function () {
  try {
    const id = window.location.hash.slice(1);
    if (!id) return;
    _viewsRecipeViewsJsDefault.default.renderSpinner();
    await _modelJs.loadRecipe(id);
    _viewsRecipeViewsJsDefault.default.render(_modelJs.state.recipe);
  } catch (err) {
    _viewsRecipeViewsJsDefault.default.renderError();
  }
};
const controlSearchResults = async function () {
  try {
    _viewsResultsViewJsDefault.default.renderSpinner();
    const query = _viewsSearchViewJsDefault.default.getQuery();
    if (!query) return;
    await _modelJs.loadSearchResults(query);
  } catch (err) {
    _viewsRecipeViewsJsDefault.default.renderError();
  }
  _viewsResultsViewJsDefault.default.render(_modelJs.state.search.results);
};
const init = function () {
  _viewsRecipeViewsJsDefault.default.addHandlerRender(controlRecipes);
  _viewsSearchViewJsDefault.default.addHandlerSearch(controlSearchResults);
};
init();
