<%@ page import="java.util.*, com.pahanaedu.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Books</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        // Handle success messages
        window.onload = function() {
            <% if ("true".equals(request.getParameter("deleted"))) { %>
            showNotification("Book deleted successfully", "success");
            <% } %>
            <% if ("true".equals(request.getParameter("updated"))) { %>
            showNotification("Book updated successfully", "success");
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

            // Auto-remove after 3 seconds
            setTimeout(() => {
                notification.remove();
            }, 3000);
        }
    </script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
<div class="container mx-auto px-4 py-8 flex-grow max-w-7xl">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
        <h2 class="text-2xl font-bold text-gray-800">Books Inventory</h2>

        <div class="flex gap-3">
            <form action="allBooks" method="get" class="inline">
                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors flex items-center">
                    <i class="fas fa-book mr-2"></i> View All Books
                </button>
            </form>

            <% if ("admin".equalsIgnoreCase(admin)) { %>
            <a href="adminPanel.jsp" class="px-4 py-2 bg-gray-200 text-gray-800 rounded-md hover:bg-gray-300 transition-colors flex items-center">
                <i class="fas fa-arrow-left mr-2"></i> Admin Panel
            </a>
            <% } %>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-8">
        <form method="get" action="allBooks" class="space-y-4 md:space-y-0 md:flex md:items-end md:gap-4">
            <div class="flex-grow">
                <label class="block text-sm font-medium text-gray-700 mb-1">Search Books</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-search text-gray-400"></i>
                    </div>
                    <input type="text" name="query" placeholder="Search by title, author, category, language"
                           class="pl-10 w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
            </div>
            <button type="submit" class="px-4 py-2 bg-yellow-500 text-gray-800 rounded-md hover:bg-yellow-600 transition-colors h-[42px]">
                <i class="fas fa-filter mr-2"></i> Search
            </button>
        </form>
    </div>

    <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">#</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Title</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Author</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Language</th>
                    <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Price (LKR)</th>
                    <% if (!"Cashier".equalsIgnoreCase(role)) { %>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    <% } %>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <%
                    List<Book> books = (List<Book>) request.getAttribute("bookList");
                    if (books != null && !books.isEmpty()) {
                        int count = 1;
                        java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance(new java.util.Locale("en", "US"));
                        nf.setMinimumFractionDigits(2);

                        for (Book b : books) {
                %>
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= count++ %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><%= b.getTitle() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= b.getCategory() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= b.getAuthor() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= b.getLanguage() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 text-right"><%= nf.format(b.getPrice()) %></td>
                    <% if (!"Cashier".equalsIgnoreCase(role)) { %>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div class="flex space-x-2">
                            <a href="BookController?action=edit&id=<%= b.getId() %>"
                               class="text-blue-600 hover:text-blue-900 flex items-center">
                                <i class="fas fa-edit mr-1"></i> Edit
                            </a>
                            <% if (!"Manager".equalsIgnoreCase(role)) { %>
                            <a href="BookController?action=delete&id=<%= b.getId() %>"
                               class="text-red-600 hover:text-red-900 flex items-center"
                               onclick="return confirm('Are you sure you want to delete this book?');">
                                <i class="fas fa-trash-alt mr-1"></i> Delete
                            </a>
                            <% } %>
                        </div>
                    </td>
                    <% } %>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="<%= !"Cashier".equalsIgnoreCase(role) ? 7 : 6 %>" class="px-6 py-4 text-center text-sm text-gray-500">
                        No books found. <% if (request.getParameter("query") != null) { %>Try a different search term.<% } %>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <% if (books != null) { %>
    <div class="mt-4 text-right">
        <span class="text-sm font-medium text-gray-700">Total Books: <span class="font-bold"><%= books.size() %></span></span>
    </div>
    <% } %>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>