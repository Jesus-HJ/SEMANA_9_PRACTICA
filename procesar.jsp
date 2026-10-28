<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
private String escapeHtml(String value) {
    if (value == null) return "";
    return value.replace("&", "&amp;").replace("<", "&lt;")
            .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
}
%>
<%
request.setCharacterEncoding("UTF-8");
String customer = request.getParameter("customer");
String phone = request.getParameter("phone");
String productId = request.getParameter("product");
String quantityText = request.getParameter("quantity");
String productName = null;
int priceCents = 0;
int quantity = 0;
String errorMessage = null;
boolean valid = false;

if (!"POST".equalsIgnoreCase(request.getMethod())) {
    response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    response.setHeader("Allow", "POST");
    errorMessage = "Este formulario solo acepta solicitudes POST.";
} else {
    if (customer != null) customer = customer.trim();
    if (phone != null) phone = phone.trim();
    try {
        quantity = Integer.parseInt(quantityText);
    } catch (NumberFormatException ignored) {
        quantity = 0;
    }

    if ("smash-clasica".equals(productId)) {
        productName = "Smash Clásica";
        priceCents = 1890;
    } else if ("doble-bacon".equals(productId)) {
        productName = "Doble Bacon";
        priceCents = 2590;
    } else if ("crispy-pollo".equals(productId)) {
        productName = "Crispy Pollo";
        priceCents = 2090;
    } else if ("papas-urbanas".equals(productId)) {
        productName = "Papas Urbanas";
        priceCents = 1090;
    }

    boolean validCustomer = customer != null
            && customer.matches("[\\p{L}\\p{M}][\\p{L}\\p{M} '\\-]{1,59}");
    boolean validPhone = phone != null && phone.matches("[0-9+() -]{7,20}");
    valid = validCustomer && validPhone && productName != null
            && quantity >= 1 && quantity <= 10;

    if (!valid) {
        response.setStatus(422);
        errorMessage = "Revisa tus datos: escribe un nombre válido, un celular de 7 a 20 caracteres, un producto del menú y una cantidad entre 1 y 10.";
    } else {
        Integer orderCount = (Integer) session.getAttribute("orderCount");
        if (orderCount == null) orderCount = 0;
        session.setAttribute("orderCount", orderCount + 1);
        session.setAttribute("lastOrder", productName + " x" + quantity);
    }
}
%>
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
    <a class="brand" href="index.jsp"><span class="brand-mark" aria-hidden="true">B</span><span>BRASA <b>URBANA</b><small>BURGERS &amp; FRIES</small></span></a>
    <p class="eyebrow">RESPUESTA DEL SERVIDOR · JSP</p>
    <% if (valid) { %>
      <h1>¡Gracias, <%= escapeHtml(customer) %>!</h1>
      <p>Pedido de demostración registrado en la sesión JSP. No se envió al restaurante.</p>
      <div class="response-summary">
        <%= quantity %> × <%= escapeHtml(productName) %><br>
        Total de ejemplo: <b>S/ <%= String.format(java.util.Locale.ROOT, "%.2f", (priceCents * quantity) / 100.0) %></b>
      </div>
    <% } else { %>
      <h1>No pudimos procesarlo.</h1>
      <p><%= escapeHtml(errorMessage) %></p>
    <% } %>
    <a class="button" href="index.jsp#pedido">Volver al formulario <span aria-hidden="true">↗</span></a>
    <p class="form-disclaimer">Práctica educativa: no se realiza un pago ni se coordina una entrega.</p>
  </main>
</body>
</html>
