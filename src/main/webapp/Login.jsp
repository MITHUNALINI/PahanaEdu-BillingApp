<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Staff Login | Book Shop</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    :root {
      --primary-color: #4a6fa5;
      --secondary-color: #166088;
      --accent-color: #4fc3f7;
      --error-color: #e74c3c;
      --light-gray: #f5f5f5;
      --dark-gray: #333;
      --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: var(--light-gray);
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .container-login {
      max-width: 450px;
      margin: 2rem auto;
      padding: 2.5rem;
      background: white;
      border-radius: 8px;
      box-shadow: var(--box-shadow);
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    h2 {
      color: var(--secondary-color);
      text-align: center;
      margin-bottom: 1.5rem;
      font-weight: 600;
    }

    .logo {
      text-align: center;
      margin-bottom: 1.5rem;
    }

    .logo img {
      height: 60px;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--dark-gray);
      font-weight: 500;
    }

    input {
      width: 100%;
      padding: 0.8rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
      transition: border-color 0.3s;
    }

    input:focus {
      outline: none;
      border-color: var(--accent-color);
      box-shadow: 0 0 0 2px rgba(79, 195, 247, 0.2);
    }

    .wide-button {
      width: 100%;
      padding: 0.8rem;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .wide-button:hover {
      background-color: var(--secondary-color);
    }

    .error-message {
      background-color: #fdecea;
      color: var(--error-color);
      padding: 0.8rem;
      border-radius: 4px;
      margin-bottom: 1.5rem;
      border-left: 4px solid var(--error-color);
      font-weight: 500;
    }

    footer {
      background-color: var(--dark-gray);
      color: white;
      text-align: center;
      padding: 1rem;
      margin-top: auto;
    }

    .forgot-password {
      text-align: center;
      margin-top: 1rem;
    }

    .forgot-password a {
      color: var(--secondary-color);
      text-decoration: none;
      font-size: 0.9rem;
    }

    .forgot-password a:hover {
      text-decoration: underline;
    }

    @media (max-width: 480px) {
      .container-login {
        margin: 1rem;
        padding: 1.5rem;
      }
    }
  </style>
</head>

<body>
<div class="container-login">
  <div class="">
    <!-- Add your logo here -->
    <img src="Images/logo.jpg" alt="Book Shop Logo" width="360"/>
  </div>

  <h2>Pahan Edu Staff Portal Login</h2>

  <% String error = (String) request.getAttribute("errorMessage");
    if (error != null) { %>
  <div class="error-message">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" style="vertical-align: text-top; margin-right: 5px;">
      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
      <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
    </svg>
    <%= error %>
  </div>
  <% } %>

  <form action="login" method="post">
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required placeholder="Enter your username" />
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required minlength="6" placeholder="Enter your password" />
    </div>
    <button type="submit" class="wide-button">Log In</button>
  </form>

  <div class="forgot-password">
    <a href="forgot-password">Forgot password?</a>
  </div>
</div>

<footer>
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>