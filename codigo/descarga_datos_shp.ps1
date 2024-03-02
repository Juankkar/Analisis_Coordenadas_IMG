## URLs de las capas SHP que nos interesan
$eennpp = "https://opendata.sitcan.es/upload/medio-ambiente/eennpp.zip"
$municipios = "https://opendata.sitcan.es/upload/unidades-administrativas/gobcan_unidades-administrativas_municipios.zip"
$downloadDirectory = "..\\datos\\"

$capas_shp = @(
    $eennpp,
    $municipios
) 

foreach ($url in $capas_shp) {
    Invoke-WebRequest -Uri $url -OutFile (Join-Path -Path $downloadDirectory -ChildPath (Split-Path -Path $url -Leaf))
}

$zipFiles = Get-ChildItem -Path $downloadDirectory -Filter *.zip
foreach ($zipFile in $zipFiles) {
    Expand-Archive -Path $zipFile.FullName -DestinationPath $downloadDirectory -Force
}
