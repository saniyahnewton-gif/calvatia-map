<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Calvatia gigantea Observations</title>

<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css"/>

<style>
html, body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
}

h2{
    text-align:center;
    margin:15px;
    color:#5c3d00;
}

p{
    text-align:center;
    margin-top:-5px;
    color:#555;
}

#map{
    height:85vh;
    width:100%;
}
</style>

</head>

<body>

<h2>Global Observations of <i>Calvatia gigantea</i></h2>

<p>Data provided by GBIF</p>

<div id="map"></div>

<script>
var map = L.map('map').setView([30, 0], 2);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

// GBIF occurrence density layer
L.tileLayer(
    'https://api.gbif.org/v2/map/occurrence/density/{z}/{x}/{y}@1x.png?taxon_key=5240420&style=classic.point',
    {
        attribution: 'GBIF'
    }
).addTo(map);
</script>
var map = L.map('map').setView([30,0],2);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
    attribution:'© OpenStreetMap contributors'
}).addTo(map);

fetch("https://api.gbif.org/v1/occurrence/search?scientificName=Calvatia%20gigantea&limit=300")

.then(response=>response.json())

.then(data=>{

data.results.forEach(function(obs){

if(obs.decimalLatitude && obs.decimalLongitude){

var marker=L.circleMarker(
[
obs.decimalLatitude,
obs.decimalLongitude
],
{
radius:5,
color:"#d68f00",
fillColor:"#f7b500",
fillOpacity:0.8
}
).addTo(map);

marker.bindPopup(
"<b>Calvatia gigantea</b><br>"
+
(obs.country || "Unknown Country")
+
"<br>"
+
(obs.eventDate || "No Date")
);

}

});

});

</script>

</body>
</html>
