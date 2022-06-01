// Initializes the page with a default plot
function initViz() {
  var containerDiv = document.getElementById("vizContainer"),
  url = "https://public.tableau.com/views/NYCLicensedDogsAnalysis/Top3DogNamesPerBorough?:language=en-US&:display_count=n&:origin=viz_share_link";

  var viz = new tableau.Viz(containerDiv, url);
};