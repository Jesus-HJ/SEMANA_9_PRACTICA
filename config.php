<?php
declare(strict_types=1);

const SITE_NAME = 'Brasa Urbana';
const MENU_ITEMS = [
    'smash-clasica' => ['name' => 'Smash Clásica', 'price_cents' => 1890],
    'doble-bacon' => ['name' => 'Doble Bacon', 'price_cents' => 2590],
    'crispy-pollo' => ['name' => 'Crispy Pollo', 'price_cents' => 2090],
    'papas-urbanas' => ['name' => 'Papas Urbanas', 'price_cents' => 1090],
];

function escape_html(string|int $value): string
{
    return htmlspecialchars((string) $value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function start_demo_session(): void
{
    if (session_status() === PHP_SESSION_ACTIVE) {
        return;
    }

    $isHttps = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off';
    session_set_cookie_params([
        'httponly' => true,
        'secure' => $isHttps,
        'samesite' => 'Lax',
    ]);

    if (!session_start()) {
        throw new RuntimeException('No se pudo iniciar la sesión de demostración.');
    }
}
