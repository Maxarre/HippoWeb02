const initAjax = (selector, htmlInput) => {
  const wrapper = document.querySelector(selector);
  wrapper.innerHTML = htmlInput;
}
export {initAjax};
