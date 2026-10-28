<?php
declare(strict_types=1);

require_once __DIR__ . '/config.php';

$orderAccepted = false;

if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
    http_response_code(405);
    header('Allow: POST');
    $message = 'Este formulario solo acepta solicitudes POST.';
} else {
    $customer = trim((string) filter_input(INPUT_POST, 'customer', FILTER_UNSAFE_RAW));
    $phone = trim((string) filter_input(INPUT_POST, 'phone', FILTER_UNSAFE_RAW));
    $productId = (string) filter_input(INPUT_POST, 'product', FILTER_UNSAFE_RAW);
    $quantity = filter_input(INPUT_POST, 'quantity', FILTER_VALIDATE_INT, [
        'options' => ['min_range' => 1, 'max_range' => 10],
    ]);

    $validCustomer = preg_match("/^[\\p{L}\\p{M}][\\p{L}\\p{M} '\\-]{1,59}$/u", $customer) === 1;
    $validPhone = preg_match('/^[0-9+() -]{7,20}$/', $phone) === 1;
    $validProduct = isset(MENU_ITEMS[$productId]);

    if (!$validCustomer || !$validPhone || !$validProduct || !is_int($quantity)) {
        http_response_code(422);
        $message = 'Revisa tus datos: escribe un nombre válido, un celular de 7 a 20 caracteres, un producto del menú y una cantidad entre 1 y 10.';
    } else {
        start_demo_session();
        $item = MENU_ITEMS[$productId];
        $totalCents = $item['price_cents'] * $quantity;
        $_SESSION['last_order'] = [
            'customer' => $customer,
            'product' => $item['name'],
            'quantity' => $quantity,
            'total_cents' => $totalCents,
        ];
        $orderAccepted = true;
        $message = 'Pedido de demostración registrado en esta sesión. No se envió al restaurante.';
    }
}
?>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Resultado del pedido | Brasa Urbana</title>
  <link rel="stylesheet" href="assets/styles.css">
</head>
<body class="response-page">
  <main class="response-card">
    <a class="brand" href="index.html"><span class="brand-mark" aria-hidden="true">B</span><span>BRASA <b>URBANA</b><small>BURGERS &amp; FRIES</small></span></a>
    <p class="eyebrow">RESPUESTA DEL SERVIDOR · PHP</p>
    <?php if ($orderAccepted): ?>
      <h1>¡Gracias, <?= escape_html($customer) ?>!</h1>
      <p><?= escape_html($message) ?></p>
      <div class="response-summary">
        <?= escape_html($quantity) ?> × <?= escape_html($item['name']) ?><br>
        Total de ejemplo: <b>S/ <?= escape_html(number_format($totalCents / 100, 2, '.', '')) ?></b>
      </div>
    <?php else: ?>
      <h1>No pudimos procesarlo.</h1>
      <p><?= escape_html($message) ?></p>
    <?php endif; ?>
    <a class="button" href="index.html#pedido">Volver al formulario <span aria-hidden="true">↗</span></a>
    <p class="form-disclaimer">Práctica educativa: no se realiza un pago ni se coordina una entrega.</p>
  </main>
</body>
</html>
