var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
_parcelHelpers.defineInteropFlag(exports);
var _urlImgIconsSvg = require('url:../../img/icons.svg');
var _urlImgIconsSvgDefault = _parcelHelpers.interopDefault(_urlImgIconsSvg);
class View {
  _data;
  render(data) {
    this._data = data;
    const markup = this._generateMarkup();
    this._clear();
    this._parentElement.insertAdjacentHTML('afterbegin', markup);
  }
  _clear() {
    this._parentElement.innerHTML = '';
  }
  renderError() {
    const markup = `<div class="error">
    <div>
      <svg>
        <use href="${_urlImgIconsSvgDefault.default}#icon-alert-triangle"></use>
      </svg>
    </div>
    <p>We Could Not Find That Recipe. Please Try Another One!😐😐😐😐🤐</p>
  </div>`;
    this._clear();
    this._parentElement.insertAdjacentHTML('afterbegin', markup);
  }
  renderMessage() {
    const markup = `<div class="message">
    <div>
      <svg>
        <use href="${_urlImgIconsSvgDefault.default}#icon-smile"></use>
      </svg>
    </div>
    <p>We Could Not Find That Recipe. Please Try Another One!😐😐😐😐🤐</p>
  </div>`;
    this._clear();
    this._parentElement.insertAdjacentHTML('afterbegin', markup);
  }
  renderSpinner() {
    const markup = `<div class="spinner">
    <svg> 
      <use href="${_urlImgIconsSvgDefault.default}#icon-loader"></use>
    </svg>
  </div>`;
    this._clear();
    this._parentElement.insertAdjacentHTML('afterbegin', markup);
  }
}
exports.default = View;
