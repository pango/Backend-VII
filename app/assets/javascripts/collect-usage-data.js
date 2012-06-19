
document.getElementById("browsertyp").innerHTML="Du benutzt " + browser;

$.ajax({
  type: 'POST',
  url: 'http://localhost:3000/usagerecords',
  data: {usagerecord: {browser: browser, language: navigator.language, homepage: document.URL, timestamp: Date(), resolution: screen.height + "x" + screen.width }},
  success: document.getElementById("example").innerHTML='Deine Browser Daten wurden erfoglreich als Usage Record gepostet.',
  //error: document.getElementById("example").innerHTML='Es gab einen Fehler beim Versuch deine Daten zu posten',
  dataType: 'json'
});


