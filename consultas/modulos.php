<?php

header('Access-Control-Allow-Origin: *');
require('./conexion.php');
date_default_timezone_set('America/Bogota');

if (isset($_GET['nuevoModulo'])) {
    $consulta = mysqli_query($enlace, "SELECT COD_MODULO AS id FROM seg_modulo ORDER BY seg_modulo.COD_MODULO DESC LIMIT 1");
    while ($row = mysqli_fetch_assoc($consulta)) { 
        $id = $row['id']; 
    }
    $id = $id+1;
    $consulta = mysqli_query($enlace, "INSERT INTO seg_modulo(COD_MODULO,NOMBRE) VALUES ('".$id."','".$_POST['nombre']."')");  
    if (mysqli_affected_rows($enlace)){ 
        $respuesta = "exito";   
    }
    if($respuesta=="exito"){
        echo $respuesta;
    }else{
        echo "mal";
    }
}

if (isset($_GET['listaModulos'])) {
    $consulta = mysqli_query($enlace, "SELECT * FROM seg_modulo WHERE ESTADO='ACT'");  
    while ($row = mysqli_fetch_assoc($consulta)) {    
      $datos['data'][] = $row;
    }
    echo json_encode($datos);
}

if (isset($_GET['eliminarModulo'])) {
    $consulta = mysqli_query($enlace, "UPDATE seg_modulo SET ESTADO='INA' WHERE COD_MODULO='".$_GET['id']."'");  
    if (mysqli_affected_rows($enlace)){ 
      $respuesta = "exito";   
    }
    if($respuesta=="exito"){
      echo $respuesta;
    }else{
      echo "mal";
    }
}

if (isset($_GET['editarModulo'])) {
    $consulta = mysqli_query($enlace, "UPDATE seg_modulo SET ESTADO='".$_POST['estado']."', NOMBRE='".$_POST['nombre']."' WHERE COD_MODULO='".$_GET['id']."'");  
    if (mysqli_affected_rows($enlace)){ 
      $respuesta = "exito";   
    }
    if($respuesta=="exito"){
      echo $respuesta;
    }else{
      echo "mal";
    }
}

if (isset($_GET['selectModulos'])) {
    $consulta = mysqli_query($enlace, "SELECT * FROM seg_modulo"); 
    $cont=0;    
    while ($row = mysqli_fetch_assoc($consulta)) {
        $cont=1;
        $datos = $datos . "<option value=" . $row['COD_MODULO'] . ">" . $row['NOMBRE'] . "</option>";
    }
    if($cont==0){
        echo ("mal");
    }else{
        echo ($datos); 
    }    
}

if (isset($_GET['listaFunciones'])) {
    $consulta = mysqli_query($enlace, "SELECT
    seg_funcionalidad.COD_FUNCIONALIDAD,
    seg_funcionalidad.URL_PRINCIPAL,
    seg_funcionalidad.NOMBRE,
    seg_funcionalidad.DESCRIPCION
    FROM
    seg_funcionalidad
    INNER JOIN seg_modulo ON seg_funcionalidad.COD_MODULO = seg_modulo.COD_MODULO
    WHERE seg_modulo.COD_MODULO ='".$_GET['modulo']."'");  
    while ($row = mysqli_fetch_assoc($consulta)) {    
      $datos['data'][] = $row;
    }
    echo json_encode($datos);
}

if (isset($_GET['selectRoles'])) {
    $consulta = mysqli_query($enlace, "SELECT * FROM seg_rol"); 
    $cont=0;    
    while ($row = mysqli_fetch_assoc($consulta)) {
        $cont=1;
        $datos = $datos . "<option value=" . $row['COD_ROL'] . ">" . $row['NOMBRE'] . "</option>";
    }
    if($cont==0){
        echo ("mal");
    }else{
        echo ($datos); 
    }    
}

if (isset($_GET['listaRoles'])) {
    $consulta = mysqli_query($enlace, "SELECT
    rol_modulo.COD_ROL,
    rol_modulo.COD_MODULO,
    seg_modulo.NOMBRE
    FROM
    rol_modulo
    INNER JOIN seg_modulo ON rol_modulo.COD_MODULO = seg_modulo.COD_MODULO
    WHERE rol_modulo.COD_ROL='".$_GET['rol']."'");  
    while ($row = mysqli_fetch_assoc($consulta)) {    
      $datos['data'][] = $row;
    }
    echo json_encode($datos);
}

if (isset($_GET['eliminarRol'])) {
    $consulta = mysqli_query($enlace, "DELETE FROM rol_modulo WHERE COD_ROL='".$_GET['idRol']."' AND COD_MODULO='".$_GET['idModulo']."'");  
    if (mysqli_affected_rows($enlace)){ 
        $respuesta = "exito";   
    }
    if($respuesta=="exito"){
        echo $respuesta;
    }else{
        echo "mal";
    }
}

if (isset($_GET['nuevoRol'])) {
    $consulta = mysqli_query($enlace, "INSERT INTO rol_modulo(COD_ROL, COD_MODULO) VALUES ('".$_POST['rol']."','".$_POST['modulo']."')");  
    if (mysqli_affected_rows($enlace)){ 
        $respuesta = "exito";   
    }
    if($respuesta=="exito"){
        echo $respuesta;
    }else{
        echo "mal";
    }
}

if (isset($_GET['eliminarFuncion'])) {
    $consulta = mysqli_query($enlace, "DELETE FROM seg_funcionalidad WHERE COD_FUNCIONALIDAD='".$_GET['idFuncion']."'");  
    if (mysqli_affected_rows($enlace)){ 
        $respuesta = "exito";   
    }
    if($respuesta=="exito"){
        echo $respuesta;
    }else{
        echo "mal";
    }
}

if (isset($_GET['editarFuncion'])) {
    $consulta = mysqli_query($enlace, "UPDATE seg_funcionalidad SET URL_PRINCIPAL='".$_POST['urlP']."', NOMBRE='".$_POST['nombre']."', DESCRIPCION='".$_POST['descripcion']."' WHERE COD_FUNCIONALIDAD='".$_POST['id']."'");  
    if (mysqli_affected_rows($enlace)){ 
      $respuesta = "exito";   
    }
    if($respuesta=="exito"){
      echo $respuesta;
    }else{
      echo "mal";
    }
}

