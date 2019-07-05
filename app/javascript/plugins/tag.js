function refreshForm(innerHTML) {
  const newReviewForm = document.querySelector('badgetag');
  newReviewForm.innerHTML = innerHTML;
}

function addTagg(tagHTML) {
  const tagglist = document.getElementById('tags');
  tagglist.insertAdjacentHTML('beforeend', tagHTML);
}


