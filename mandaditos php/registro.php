<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

include 'conexion.php';

$data = json_decode(file_get_contents("php://input"));

$nombre = $data->nombre;
$apellido = $data->apellido;
$ruta = $data->rutaSeleccionada;
$direccion = $data->direccion;
$telefono = $data->telefono;
$correo = $data->correo;
$password = $data->password;

$query_check_email = "SELECT COUNT(*) AS count FROM clientes WHERE correo = '$correo'";
$result_check_email = $conn->query($query_check_email);
$row_check_email = $result_check_email->fetch_assoc();
if ($row_check_email['count'] > 0) {
    echo json_encode(array("message" => "El correo electrónico ya está registrado"));
    exit();
}

$verificado = 1;
$codigo_verificacion = generateRandomNumber(100000, 999999);

$query_last_id = "SELECT MAX(cliente_id) AS max_id FROM clientes";
$result = $conn->query($query_last_id);
$row = $result->fetch_assoc();
$last_id = $row['max_id'];
$next_id = $last_id + 1;

$sql = "INSERT INTO clientes (cliente_id, nombre, apellido, localidad, telefono, correo, password, verificado, codigo_verificacion) VALUES ('$next_id', '$nombre','$apellido','$ruta','$telefono','$correo', '$password', '$verificado', '$codigo_verificacion')";

if ($conn->query($sql) === TRUE) {
    $sql_direccion = "INSERT INTO direcciones (cliente_id, direccion) VALUES ('$next_id', '$direccion')";
    if ($conn->query($sql_direccion) === TRUE) {
        echo json_encode(array("message" => "success"));
    } else {
        echo json_encode(array("message" => "Error al registrar dirección: " . $conn->error));
    }
} else {
    echo json_encode(array("message" => "Error al registrar usuario: " . $conn->error));
}
$conn->close();

function generateRandomNumber($min, $max) {
    return mt_rand($min, $max);
}
?>