<%@ page session="true" %>
<%@ page import="com.pahanaedu.model.User" %>

<%
    User u = (User) session.getAttribute("user");
    String admin = (String) session.getAttribute("admin");

    if (u == null && (admin == null || !"admin".equalsIgnoreCase(admin))) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String username = (u != null) ? u.getUsername() : "admin";
    String role = (u != null) ? u.getRole() : "admin";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pahana Edu Book Shop</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            50: '#eff6ff',
                            500: '#3b82f6',
                            600: '#2563eb',
                            700: '#1d4ed8',
                            800: '#1e40af',
                            900: '#1e3a8a'
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>

<header class="bg-white shadow-lg border-b-4 border-gradient-to-r from-blue-500 to-purple-600 sticky top-0 z-50">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">

            <!-- Logo and Brand -->
            <div class="flex items-center flex-shrink-0">
                <a href="<%= (admin != null && admin.equalsIgnoreCase("admin")) ? "adminPanel.jsp" : "mainInterface.jsp" %>"
                   class="flex items-center space-x-3 group transition-all duration-300 hover:scale-105"
                   title="<%= (admin != null && admin.equalsIgnoreCase("admin"))
                        ? "Click to view Admin Panel"
                        : "Click to view Dashboard" %>">

                    <div class="relative">
                        <div class="absolute inset-0 bg-gradient-to-r from-blue-500 to-purple-600 rounded-lg opacity-20 group-hover:opacity-30 transition-opacity duration-300"></div>
                        <img src="Images/logo.png" alt="Logo" class="h-12 w-12 relative z-10 rounded-lg">
                    </div>

                    <div class="hidden sm:block">
                        <h1 class="text-xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                            Pahana Edu Book Shop
                        </h1>
                        <p class="text-sm text-gray-500">Educational Excellence</p>
                    </div>
                </a>
            </div>

            <!-- Desktop Navigation Menu -->
            <div class="hidden md:flex items-center space-x-1">

                <!-- Customer Management Dropdown -->
                <div class="relative group">
                    <button class="flex items-center px-4 py-2 text-gray-700 hover:text-blue-600 font-medium rounded-lg hover:bg-blue-50 transition-all duration-200 group">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
                        Customer Management
                        <svg class="w-4 h-4 ml-1 transition-transform duration-200 group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                        </svg>
                    </button>
                    <div class="absolute top-full left-0 mt-1 w-56 bg-white rounded-xl shadow-lg border border-gray-100 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0 z-50">
                        <div class="py-2">
                            <a href="addCustomer.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 transition-colors duration-200">
                                <svg class="w-4 h-4 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                </svg>
                                Add Customer
                            </a>
                            <a href="CustomerController?action=list" class="flex items-center px-4 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-600 transition-colors duration-200">
                                <svg class="w-4 h-4 mr-3 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                View All Customers
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Book Management Dropdown -->
                <div class="relative group">
                    <button class="flex items-center px-4 py-2 text-gray-700 hover:text-green-600 font-medium rounded-lg hover:bg-green-50 transition-all duration-200 group">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                        </svg>
                        Book Management
                        <svg class="w-4 h-4 ml-1 transition-transform duration-200 group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                        </svg>
                    </button>
                    <div class="absolute top-full left-0 mt-1 w-56 bg-white rounded-xl shadow-lg border border-gray-100 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0 z-50">
                        <div class="py-2">
                            <a href="addBook.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-green-50 hover:text-green-600 transition-colors duration-200">
                                <svg class="w-4 h-4 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                </svg>
                                Add Books
                            </a>
                            <a href="allBooks" class="flex items-center px-4 py-3 text-gray-700 hover:bg-green-50 hover:text-green-600 transition-colors duration-200">
                                <svg class="w-4 h-4 mr-3 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                View All Books
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Billing Management Dropdown -->
                <div class="relative group">
                    <button class="flex items-center px-4 py-2 text-gray-700 hover:text-purple-600 font-medium rounded-lg hover:bg-purple-50 transition-all duration-200 group">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
                        </svg>
                        Billing Management
                        <svg class="w-4 h-4 ml-1 transition-transform duration-200 group-hover:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                        </svg>
                    </button>
                    <div class="absolute top-full left-0 mt-1 w-56 bg-white rounded-xl shadow-lg border border-gray-100 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 transform translate-y-2 group-hover:translate-y-0 z-50">
                        <div class="py-2">
                            <a href="BillController?action=add" class="flex items-center px-4 py-3 text-gray-700 hover:bg-purple-50 hover:text-purple-600 transition-colors duration-200">
                                <svg class="w-4 h-4 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                </svg>
                                Add New Bill
                            </a>
                            <a href="BillController?action=list" class="flex items-center px-4 py-3 text-gray-700 hover:bg-purple-50 hover:text-purple-600 transition-colors duration-200">
                                <svg class="w-4 h-4 mr-3 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                                </svg>
                                View Sales
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side Navigation -->
            <div class="flex items-center space-x-4">

                <!-- User Info (Desktop) -->
                <div class="hidden lg:flex items-center space-x-3">
                    <div class="flex items-center space-x-2 bg-gray-50 px-4 py-2 rounded-lg">
                        <div class="w-8 h-8 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full flex items-center justify-center">
                            <span class="text-white font-semibold text-sm"><%= username.substring(0, 1).toUpperCase() %></span>
                        </div>
                        <div class="text-sm">
                            <div class="font-medium text-gray-900"><%= username.toUpperCase() %></div>
                            <div class="text-gray-500 capitalize"><%= role %></div>
                        </div>
                    </div>
                </div>

                <!-- Help Button -->
                <a href="help.jsp"
                   class="flex items-center px-3 py-2 text-gray-600 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-all duration-200 group">
                    <svg class="w-5 h-5 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <span class="hidden sm:inline">Help</span>
                </a>

                <!-- Logout Button -->
                <a href="logout"
                   class="flex items-center px-4 py-2 bg-red-50 text-red-600 hover:bg-red-100 hover:text-red-700 rounded-lg transition-all duration-200 font-medium group">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                    </svg>
                    Logout
                </a>

                <!-- Mobile Menu Button -->
                <button class="md:hidden p-2 text-gray-600 hover:bg-gray-100 rounded-lg" onclick="toggleMobileMenu()">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu" class="md:hidden hidden bg-white border-t border-gray-200 py-4">
            <!-- User Info Mobile -->
            <div class="flex items-center space-x-3 px-4 py-3 border-b border-gray-100 mb-4">
                <div class="w-10 h-10 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full flex items-center justify-center">
                    <span class="text-white font-semibold"><%= username.substring(0, 1).toUpperCase() %></span>
                </div>
                <div>
                    <div class="font-medium text-gray-900"><%= username.toUpperCase() %></div>
                    <div class="text-sm text-gray-500 capitalize"><%= role %></div>
                </div>
            </div>

            <!-- Mobile Navigation Links -->
            <div class="space-y-2 px-4">
                <div class="font-medium text-gray-900 mb-2">Customer Management</div>
                <a href="addCustomer.jsp" class="block px-4 py-2 text-gray-600 hover:bg-gray-50 rounded-lg">Add Customer</a>
                <a href="CustomerController?action=list" class="block px-4 py-2 text-gray-600 hover:bg-gray-50 rounded-lg">View All Customers</a>

                <div class="font-medium text-gray-900 mb-2 mt-4">Book Management</div>
                <a href="addBook.jsp" class="block px-4 py-2 text-gray-600 hover:bg-gray-50 rounded-lg">Add Books</a>
                <a href="allBooks" class="block px-4 py-2 text-gray-600 hover:bg-gray-50 rounded-lg">View All Books</a>

                <div class="font-medium text-gray-900 mb-2 mt-4">Billing Management</div>
                <a href="BillController?action=add" class="block px-4 py-2 text-gray-600 hover:bg-gray-50 rounded-lg">Add New Bill</a>
                <a href="BillController?action=list" class="block px-4 py-2 text-gray-600 hover:bg-gray-50 rounded-lg">View Sales</a>
            </div>
        </div>
    </nav>
</header>

<script>
    function toggleMobileMenu() {
        const menu = document.getElementById('mobileMenu');
        menu.classList.toggle('hidden');
    }

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        const menu = document.getElementById('mobileMenu');
        const button = event.target.closest('button');

        if (!menu.contains(event.target) && !button) {
            menu.classList.add('hidden');
        }
    });
</script>

</body>
</html>