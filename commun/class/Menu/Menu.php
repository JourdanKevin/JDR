<?php
class Menu {   
    function createMenu($tMenu, $tExt = false, $classDiv = "") {
        echo '<div class='.$classDiv.'>';
            if ($tExt) foreach ($tExt as $line) echo $line;
            echo '<nav>';
                foreach ($tMenu as $name=>$file)
                    echo "<a class=$name href=$file>".ucfirst($name)."</a>";
            echo '</nav>';                
        echo '</div>';
    }
    function createTitle($title){
        echo '<div class="headerDiv">';
            echo "<h1 id='title' class=\"title\">$title</h1>";
        echo '</div>';
    }
}

?>