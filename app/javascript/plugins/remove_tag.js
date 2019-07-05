const removeTag = () => {
  const tagglist = document.querySelectorAll('.removetagg');
  tagglist.forEach((tag) => {
    tag.addEventListener('click', (event) => {
      var tag = event.currentTarget.dataset.tag;

    })
  });
  console.log(tagglist)
}

export {removeTag}
