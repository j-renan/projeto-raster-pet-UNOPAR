<?php
  include '../dao/petDao.php';

    $petDAO = new PetDao();
    $listaPets = $petDAO->listarPorTutor(1);
    //buscar lista de PETS
    
    $dataInicio = "";
    $dataFim = "";
    $petId = "";
    $dadosRastreador = [];

    if (isset($_POST["salvar"])){
      $dataInicio = $_POST['datainicial'];
      $dataFim = $_POST['datafinal'];
      $petId = $_POST['petId'];
      //$petId = 1;
      $dadosRastreador = $petDAO->listarTrajetoPorPetEData($petId, $dataInicio, $dataFim);
      print_r($dadosRastreador);
    }
    else  if (isset($_POST["limpar"])){
      $dataInicio = "";
      $dataFim = "";
      $petId = "";
      $dadosRastreador = [];
    }

?>




<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Raster Pet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.1/css/ol.css" type="text/css">
         <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.1/build/ol.js"></script>
</head>
<style>
      .map {
        height: 400px;
        width: 100%;
      }
    </style>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">Raster Pet</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-item nav-link active" href="#">Tutor: Henrique <span class="sr-only">(current)</span></a>
        </div>
      </div>
    </nav>
      <br>
    <div class="container">
      <div class="row">
        <div class="col-6">
          <h3>Dados do Formulário</h3>
          <form action="pesquisa.php" method="post">
              <div class="form-group">
                <label for="datainicial">Data Inicial</label>
                <input type="date" class="form-control" name="datainicial" placeholder="clique" value="<?php echo $dataInicio;?>">
              </div>
              <div class="form-group">
                <label for="datafinal">Data Final</label>
                <input type="date" class="form-control" name="datafinal" placeholder="clique" value="<?php echo $dataFim;?>">
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Selecione o PET</label>
                  <select class="form-control" name="petId">
                        <?php
                        for ($i = 0; $i < count($listaPets); $i++) {
                            $linha = $listaPets[$i];
                            echo '<option value="' . $linha["id"] . '">' . $linha["nome"] . '</option>';
                        }
                        ?>
                  </select>               
              </div>
              <button class="btn btn-primary" type="submit" name="salvar">Pesquisar</button>
              <button class="btn btn-primary" type="submit" name="limpar">Limpar</button>

            </form>
        </div>
        <div class="col-6">
          <h3>Tabela</h3>
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">Data/Hora</th>
                <th scope="col">Latitude</th>
                <th scope="col">Longitude</th>
              </tr>
            </thead>
            <tbody>
              <?php
                
                for($i=0; $i < count($dadosRastreador); $i++){
                  $linha = $dadosRastreador[$i];

                  echo "
                    <tr>
                      <td>".date('d/m/Y', strtotime($linha['data']))."</td>
                      <td>".$linha['latitude']."</td>
                      <td>".$linha['longitude']."</td>                    
                    </tr>
                  
                  ";

                
                }
              
              ?>   
           
            </tbody>
          </table>
        </div>
      </div>     
    </div>
      <br>
      <div id="map" class="map">
      </div>
</body>

<script>
   const mapa = new ol.Map({
    target: 'map',
    layers: [
      new ol.layer.Tile({
        name: 'areas',
        source: new ol.source.OSM(),
      })
    ],
    view: new ol.View({
      center: ol.proj.fromLonLat([37.41, 8.82]),
      zoom: 4
    })
  });

  function exibirTrajetoMapa() {
    const trajeto = '<?php echo json_encode($dadosRastreador); ?>';

    if (JSON.parse(trajeto)) {

      const dadosRastreador = JSON.parse(trajeto)

      const contornos = [];
      dadosRastreador.map(item => contornos.push([item.longitude, item.latitude]))

      const vector = new ol.layer.Vector({
        style: new ol.style.Style({
          stroke: new ol.style.Stroke({
            color: '#EFA012',
            width: 2
          }),
          
        }),
        source: new ol.source.Vector(),
        visible: true,
        name: 'areas'
      });

      var feature = new ol.Feature();
      var polygon = new ol.geom.Polygon([contornos]);

      feature.setGeometry(polygon.transform('EPSG:4326', 'EPSG:3857'));
      vector.getSource().addFeature(feature);     

      var extent = vector.getSource().getExtent();
      mapa.getView().fit(extent, mapa.getSize());
      mapa.getView().setZoom(16);
      mapa.addLayer(vector);
    }
  }

  exibirTrajetoMapa()
</script>
</html>