var title = document.getElementById("title");
var navLinks = document.querySelectorAll("nav a")
var teamCards = document.querySelectorAll(".team-card")

// Target example: CSS selector
anime({
  targets: title,
  opacity: [0, 1],
  easing: "easeInOutExpo"
})

// Target example: Nodelist
anime({
  targets: teamCards,
  opacity: [0, 1],
  delay: anime.stagger(150)
})

// Target example: Nodelist
anime({
  targets: navLinks,
  opacity: [0, 1],
  delay: anime.stagger(150)
})
