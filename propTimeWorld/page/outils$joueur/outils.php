<?php include "../../commun/component/topbar.php"; titre("Outils");?>
<script src="../../../commun/function/js/jquery.min.js"></script>
<script src="js/use.js?t=<?=time()?>"></script>
<?php
  $tmenue = array();
  if($dossier = opendir('outilsPage')) while(false !== ($fichier = readdir($dossier))) if($fichier != '.' && $fichier != '..') $tmenue[$fichier] = $fichier."/".$fichier.".php" ;
?>
<body>
  <div class="vertical-menu">
    <a class="title">Liste des outils</a>
    <?php foreach ($tmenue as $item => $val) echo ('<a id='.$item.'>'.ucFirst(str_replace("_"," ",$item)).'</a>');?>
  </div>
  <?php foreach ($tmenue as $item => $val) include "outilsPage/".$val;?>
</body>

<!-- <?php include "../../commun/component/footbar.php";?> -->
</html>