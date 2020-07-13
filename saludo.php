<?php
    include "cabecera.inc.php";
    include "conexion.inc.php";
    session_start();
    if(!isset($_SESSION['ci'])){
        header("Location: login.php"); 
    }
    $carnet=$_SESSION['ci'];
    $result =mysqli_query($conn,"select * from identificador where ci='".$carnet."'");
    $fila=mysqli_fetch_row($result);
    $name=$fila[1];
    $image=$fila[4];
?>
<?php
if(isset($fila[5])){
    $myfield=$fila[5];
        echo '<div class="content" style="background:'.$myfield.'">';
}
else{
    echo '<div class="content">';
}
?>
    <div class="header">
        <div class="wrapper">
            <div class="header-content">
                <h1 class="title">Primer Parcial</h1>
                <div class="menu">
                    <?php 
                        echo '<p class="content-text"><span>Hola</span> '.$name.'</p>';
                        echo '<img class="foto" src="'.$image.'" alt="">';
                        ?>
                    <form class="fondo" action="control.php" method="POST">
                    <?php
                            echo '<input type="hidden" name="carnet" value="'.$carnet.'"/>';
                        ?>
                        <select class="select" name='color' onchange='this.form.submit();'>
                            <option>Color de fondo</option>
                            <option value="purple">violeta</option>
                            <option value="red">rojo</option>
                            <option value="green">verde</option>
                        </select>
                    </form>
                    <p class="content-text"><a class="logout" href="logout.php">Cerrar Session</a></p>
                </div>
            </div>
        </div>
    </div>
    <?php 
    include "notas.php"
    ?>
</div>

<?php
include "pie.inc.php";
?>