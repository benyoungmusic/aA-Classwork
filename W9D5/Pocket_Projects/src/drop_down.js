
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = () => {
  let dogArray = [];
  for (dog_name in dogs) {
    const li = document.createElement("li")
    const a = document.createElement("a");
    a.innerHTML = dog_name;
    a.href = dogs[dog_name];
    li.className = 'dog-link';
    li.append(a);
    dogArray.push(li);
  }
  return dogArray;
}

const attachDogLinks = () => {
  let dogLinks = dogLinkCreator();
  for (i = 0; i < dogLinks.length; i++) {
    const ul = document.querySelector(".drop-down-dog-list");
    ul.appendChild(dogLinks[i])
  }
}

const dogListHide = (e) => {
  e.classList.add("hidden");
}

const dogListShow = (e) => {
  e.classList.remove("hidden");
}

const h3 = document.querySelector(".dog-list-header")
const nav = document.querySelector(".drop-down-dog-nav")

h3.addEventListener("mouseenter", e => {
  const ul = document.querySelector(".drop-down-dog-list");
  dogListShow(ul);
});

nav.addEventListener("mouseleave", e => {
  const ul = document.querySelector(".drop-down-dog-list");
  dogListHide(ul);
});


attachDogLinks();