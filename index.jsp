<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Hamburguesas smash, papas crocantes y combos hechos al momento en Brasa Urbana.">
  <title>Brasa Urbana | Hamburguesas hechas al momento</title>
  <link rel="preconnect" href="https://images.unsplash.com">
  <link rel="stylesheet" href="assets/styles.css">
  <script src="assets/site.js" defer></script>
</head>
<body>
  <header class="site-header">
    <a class="brand" href="#inicio" aria-label="Brasa Urbana, inicio">
      <span class="brand-mark" aria-hidden="true">B</span>
      <span>BRASA <b>URBANA</b><small>BURGERS &amp; FRIES</small></span>
    </a>
    <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="main-nav" aria-label="Abrir menú">
      <span></span><span></span><span></span>
    </button>
    <nav class="main-nav" id="main-nav" aria-label="Navegación principal">
      <a href="#menu">Menú</a>
      <a href="#nosotros">Nosotros</a>
      <a href="#visitanos">Visítanos</a>
      <a class="button button-small" href="#pedido">Pedir ahora <span aria-hidden="true">↗</span></a>
    </nav>
  </header>

  <main>
    <section class="hero section-wrap" id="inicio">
      <div class="hero-copy">
        <p class="eyebrow"><span class="eyebrow-dot"></span> HECHAS AL MOMENTO · HUANCAYO</p>
        <h1>Antojo de verdad.<br><span>Sabor sin reglas.</span></h1>
        <p class="hero-description">Carne a la plancha, queso derritiéndose y papas bien crocantes. Tu próxima hamburguesa favorita está a un mordisco.</p>
        <div class="hero-actions">
          <a class="button" href="#menu">Explorar el menú <span aria-hidden="true">↘</span></a>
          <span class="hero-note"><span class="stars" aria-hidden="true">★★★★★</span> <b>4.9</b> · puro sabor local</span>
        </div>
        <div class="hero-stats" aria-label="Lo que nos hace especiales">
          <div><strong>100%</strong><span>hecho al momento</span></div>
          <div><strong>12 min</strong><span>para matar el antojo</span></div>
          <div><strong>Local</strong><span>con orgullo huancaíno</span></div>
        </div>
      </div>
      <div class="hero-visual">
        <div class="hero-image-frame">
          <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&amp;fit=crop&amp;w=1100&amp;q=85" alt="Hamburguesa con queso, lechuga y tomate recién preparada" fetchpriority="high">
          <span class="image-sticker">FRESCA<br><b>&amp; BRUTAL</b></span>
        </div>
        <div class="hero-price"><span>FAVORITA DE LA CASA</span><strong>La Smash <b>S/ 18.90</b></strong></div>
        <span class="hero-spark" aria-hidden="true">✳</span>
      </div>
    </section>

    <section class="menu-section section-wrap" id="menu">
      <div class="section-heading">
        <div><p class="eyebrow">EL MENÚ QUE SÍ PROVOCA</p><h2>Arma tu <span>felicidad.</span></h2></div>
        <p>Ingredientes frescos, porciones honestas y cero complicaciones. ¿Cuál va primero?</p>
      </div>
      <div class="menu-grid">
        <article class="menu-card">
          <div class="menu-photo"><img src="https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&amp;fit=crop&amp;w=700&amp;q=80" alt="Hamburguesa clásica con queso y vegetales" loading="lazy"><span class="menu-tag">LA CLÁSICA</span></div>
          <div class="menu-info"><div><h3>Smash Clásica</h3><p>Carne smash, queso cheddar, lechuga y salsa de la casa.</p></div><strong>S/ 18.90</strong></div>
          <a class="menu-link" href="#pedido" data-product="smash-clasica">La quiero <span aria-hidden="true">↗</span></a>
        </article>
        <article class="menu-card">
          <div class="menu-photo"><img src="https://images.unsplash.com/photo-1571091718767-18b5b1457add?auto=format&amp;fit=crop&amp;w=700&amp;q=80" alt="Hamburguesa doble con tocino y queso" loading="lazy"><span class="menu-tag">MÁS PEDIDA</span></div>
          <div class="menu-info"><div><h3>Doble Bacon</h3><p>Doble carne, doble cheddar, tocino crocante y cebolla.</p></div><strong>S/ 25.90</strong></div>
          <a class="menu-link" href="#pedido" data-product="doble-bacon">La quiero <span aria-hidden="true">↗</span></a>
        </article>
        <article class="menu-card">
          <div class="menu-photo"><img src="https://images.unsplash.com/photo-1606755962773-d324e0a13086?auto=format&amp;fit=crop&amp;w=700&amp;q=80" alt="Hamburguesa de pollo crocante" loading="lazy"><span class="menu-tag">CRUNCH TIME</span></div>
          <div class="menu-info"><div><h3>Crispy Pollo</h3><p>Pollo crocante, coleslaw fresco y mayo ligeramente picante.</p></div><strong>S/ 20.90</strong></div>
          <a class="menu-link" href="#pedido" data-product="crispy-pollo">La quiero <span aria-hidden="true">↗</span></a>
        </article>
        <article class="menu-card">
          <div class="menu-photo"><img src="https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&amp;fit=crop&amp;w=700&amp;q=80" alt="Porción de papas fritas doradas y crocantes" loading="lazy"><span class="menu-tag">PARA COMPARTIR</span></div>
          <div class="menu-info"><div><h3>Papas Urbanas</h3><p>Papas doradas, sal de la casa y dip de ají amarillo.</p></div><strong>S/ 10.90</strong></div>
          <a class="menu-link" href="#pedido" data-product="papas-urbanas">Las quiero <span aria-hidden="true">↗</span></a>
        </article>
      </div>
    </section>

    <section class="order-section" id="pedido">
      <div class="order-inner section-wrap">
        <div class="order-copy">
          <p class="eyebrow"><span class="eyebrow-dot"></span> UN BUEN PLAN EMPIEZA AQUÍ</p>
          <h2>Tu antojo.<br><span>Tu pedido.</span></h2>
          <p>Elige tu favorito y deja tus datos para probar el recorrido del pedido. Esta práctica registra una demostración en tu sesión; todavía no envía pedidos reales.</p>
          <div class="order-promise"><span aria-hidden="true">✳</span><div><b>Recién hecho, siempre</b><small>El sabor no se apura.</small></div></div>
        </div>
        <form class="order-form" action="procesar.jsp" method="post">
          <div class="form-heading"><span>PEDIDO DE PRUEBA</span><span class="form-step">01 / 01</span></div>
          <label for="customer">Tu nombre</label>
          <input id="customer" name="customer" type="text" autocomplete="name" minlength="2" maxlength="60" placeholder="¿Cómo te llamas?" required>
          <div class="form-row">
            <div><label for="phone">Celular</label><input id="phone" name="phone" type="tel" autocomplete="tel" minlength="7" maxlength="20" placeholder="999 123 456" required></div>
            <div><label for="quantity">Cantidad</label><input id="quantity" name="quantity" type="number" min="1" max="10" value="1" required></div>
          </div>
          <label for="product-select">¿Qué se te antoja?</label>
          <select id="product-select" name="product" required>
            <option value="">Elige algo rico</option>
            <option value="smash-clasica">Smash Clásica — S/ 18.90</option>
            <option value="doble-bacon">Doble Bacon — S/ 25.90</option>
            <option value="crispy-pollo">Crispy Pollo — S/ 20.90</option>
            <option value="papas-urbanas">Papas Urbanas — S/ 10.90</option>
          </select>
          <button class="button form-submit" type="submit">Revisar mi pedido <span aria-hidden="true">↗</span></button>
          <p class="form-disclaimer">Sin pagos ni envíos reales. El total se calcula en el servidor.</p>
          <p class="order-total" aria-live="polite">Total estimado <b>S/ 0.00</b></p>
        </form>
      </div>
    </section>

    <section class="about-section section-wrap" id="nosotros">
      <div class="about-mark" aria-hidden="true">B<span>✳</span></div>
      <div class="about-copy"><p class="eyebrow">SOMOS DE AQUÍ, SABEMOS A QUÉ SABE</p><h2>La buena comida<br>junta a la gente.</h2><p>Nacimos con una idea sencilla: hacer hamburguesas generosas, con ingredientes frescos y sabor de barrio. Sin poses; solo buena brasa y ganas de compartir.</p></div>
      <div class="about-note"><span>HECHO CON</span><strong>hambre<br><i>y cariño.</i></strong><span>DESDE HUANCAYO · PERÚ</span></div>
    </section>

    <section class="visit-section section-wrap" id="visitanos">
      <div><p class="eyebrow">CAES CUANDO QUIERAS</p><h2>Nos vemos en<br><span>la próxima mordida.</span></h2></div>
      <div class="visit-details"><p><span>⌖</span><b>Dirección por confirmar</b><small>Huancayo, Junín, Perú</small></p><p><span>◷</span><b>Horario de ejemplo</b><small>Lun–Dom · 12:00–22:00</small></p></div>
      <a class="button" href="#pedido">Elegir mi pedido <span aria-hidden="true">↗</span></a>
    </section>
  </main>

  <footer class="site-footer">
    <a class="brand footer-brand" href="#inicio"><span class="brand-mark" aria-hidden="true">B</span><span>BRASA <b>URBANA</b><small>BURGERS &amp; FRIES</small></span></a>
    <p>Una idea de restaurante para la práctica de Desarrollo Web · Semana 09.</p>
    <a href="#inicio">Volver arriba ↑</a>
  </footer>
</body>
</html>
