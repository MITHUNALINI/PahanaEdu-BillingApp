<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add New Customer</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script>
    // Handle success/error messages
    window.onload = function() {
      <% String message = (String) session.getAttribute("message"); %>
      <% if (message != null) { %>
      showNotification("<%= message %>", "success");
      <% session.removeAttribute("message"); %>
      <% } %>

      <% String error = (String) request.getAttribute("error"); %>
      <% if (error != null) { %>
      showNotification("<%= error %>", "error");
      <% } %>
    };

    function showNotification(message, type) {
      const notification = document.createElement("div");
      notification.className = `fixed top-4 right-4 px-6 py-3 rounded-md shadow-lg text-white ${
        type == "success" ? "bg-green-500" : "bg-red-500"
      } flex items-center justify-between z-50`;
      notification.innerHTML = `
        <span>${message}</span>
        <button onclick="this.parentElement.remove()" class="ml-4">
          <i class="fas fa-times"></i>
        </button>
      `;
      document.body.appendChild(notification);

      // Auto-remove after 5 seconds
      setTimeout(() => {
        notification.remove();
      }, 5000);
    }
  </script>
</head>
<body class="bg-gray-50 min-h-screen">
<div class="container mx-auto px-4 py-8 max-w-md">
  <div class="bg-white rounded-xl shadow-md overflow-hidden">
    <div class="bg-blue-600 py-4 px-6">
      <h2 class="text-xl font-semibold text-white flex items-center">
        <i class="fas fa-user-plus mr-2"></i> Add New Customer
      </h2>
    </div>

    <div class="p-6">
      <form action="CustomerController?action=add" method="post" class="space-y-4">
        <div>
          <label for="name" class="block text-sm font-medium text-gray-700 mb-1">
            <i class="fas fa-user text-blue-500 mr-1"></i> Customer Name
          </label>
          <input type="text" id="name" name="name" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                 placeholder="Enter customer name">
        </div>

        <div>
          <label for="address" class="block text-sm font-medium text-gray-700 mb-1">
            <i class="fas fa-map-marker-alt text-blue-500 mr-1"></i> Address
          </label>
          <input type="text" id="address" name="address" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                 placeholder="Enter customer address">
        </div>

        <div>
          <label for="telephone" class="block text-sm font-medium text-gray-700 mb-1">
            <i class="fas fa-phone text-blue-500 mr-1"></i> Telephone
          </label>
          <input type="tel" id="telephone" name="telephone" required pattern="\d{10}"
                 title="Please enter exactly 10 digits"
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                 placeholder="Enter 10-digit phone number">
          <p class="mt-1 text-xs text-gray-500">Format: 10 digits (e.g., 0771234567)</p>
        </div>

        <div>
          <label for="email" class="block text-sm font-medium text-gray-700 mb-1">
            <i class="fas fa-envelope text-blue-500 mr-1"></i> Email
          </label>
          <input type="email" id="email" name="email" required
                 class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                 placeholder="Enter customer email">
        </div>

        <div class="pt-2">
          <button type="submit"
                  class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-md transition duration-300 ease-in-out transform hover:scale-105">
            <i class="fas fa-save mr-2"></i> Add Customer
          </button>
        </div>
      </form>
    </div>
  </div>

  <div class="mt-4 text-center">
    <a href="customerList.jsp" class="text-blue-600 hover:text-blue-800 text-sm font-medium">
      <i class="fas fa-arrow-left mr-1"></i> Back to Customer List
    </a>
  </div>
</div>
</body>
</html>