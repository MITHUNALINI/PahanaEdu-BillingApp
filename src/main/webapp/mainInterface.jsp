<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dashboard</title>
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
							700: '#1d4ed8'
						}
					}
				}
			}
		}
	</script>
</head>
<body class="bg-gray-50 min-h-screen">
<div class="min-h-screen flex flex-col">
	<!-- Main Content -->
	<div class="flex-1 py-8 px-4 sm:px-6 lg:px-8">
		<div class="max-w-7xl mx-auto">
			<!-- Title Section -->
			<div class="text-center mb-12">
				<h1 class="text-4xl font-bold text-gray-900 mb-4">
					Dashboard
				</h1>
				<p class="text-lg text-gray-600 max-w-2xl mx-auto">
					Manage your bookstore operations from this central hub
				</p>
			</div>

			<!-- Dashboard Grid -->
			<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-6xl mx-auto">
				<!-- Customer Management Section -->
				<div class="bg-white rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300 overflow-hidden">
					<div class="bg-gradient-to-r from-blue-500 to-blue-600 p-6">
						<div class="flex items-center">
							<div class="bg-white bg-opacity-20 rounded-lg p-3">
								<svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
									<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
								</svg>
							</div>
							<div class="ml-4">
								<h3 class="text-xl font-semibold text-white">Customer Management</h3>
								<p class="text-blue-100">Manage customer information</p>
							</div>
						</div>
					</div>
					<div class="p-6 space-y-3">
						<a href="addCustomer.jsp"
						   class="block w-full bg-blue-50 hover:bg-blue-100 text-blue-700 font-medium py-3 px-4 rounded-lg transition-colors duration-200 text-center border border-blue-200 hover:border-blue-300">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                    </svg>
                                    Add Customer
                                </span>
						</a>
						<a href="CustomerController?action=list"
						   class="block w-full bg-white hover:bg-gray-50 text-gray-700 font-medium py-3 px-4 rounded-lg transition-colors duration-200 text-center border border-gray-300 hover:border-gray-400">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                    </svg>
                                    View All Customers
                                </span>
						</a>
					</div>
				</div>

				<!-- Book Management Section -->
				<div class="bg-white rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300 overflow-hidden">
					<div class="bg-gradient-to-r from-green-500 to-green-600 p-6">
						<div class="flex items-center">
							<div class="bg-white bg-opacity-20 rounded-lg p-3">
								<svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
									<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
								</svg>
							</div>
							<div class="ml-4">
								<h3 class="text-xl font-semibold text-white">Book Management</h3>
								<p class="text-green-100">Manage book inventory</p>
							</div>
						</div>
					</div>
					<div class="p-6 space-y-3">
						<a href="BookController?action=add"
						   class="block w-full bg-green-50 hover:bg-green-100 text-green-700 font-medium py-3 px-4 rounded-lg transition-colors duration-200 text-center border border-green-200 hover:border-green-300">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                    </svg>
                                    Add Book
                                </span>
						</a>
						<a href="BookController?action=list"
						   class="block w-full bg-white hover:bg-gray-50 text-gray-700 font-medium py-3 px-4 rounded-lg transition-colors duration-200 text-center border border-gray-300 hover:border-gray-400">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                    </svg>
                                    View All Books
                                </span>
						</a>
					</div>
				</div>

				<!-- Sales Management Section -->
				<div class="bg-white rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300 overflow-hidden">
					<div class="bg-gradient-to-r from-purple-500 to-purple-600 p-6">
						<div class="flex items-center">
							<div class="bg-white bg-opacity-20 rounded-lg p-3">
								<svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
									<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path>
								</svg>
							</div>
							<div class="ml-4">
								<h3 class="text-xl font-semibold text-white">Sales Management</h3>
								<p class="text-purple-100">Manage bills and sales</p>
							</div>
						</div>
					</div>
					<div class="p-6 space-y-3">
						<a href="BillController?action=add"
						   class="block w-full bg-purple-50 hover:bg-purple-100 text-purple-700 font-medium py-3 px-4 rounded-lg transition-colors duration-200 text-center border border-purple-200 hover:border-purple-300">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                    </svg>
                                    Add New Bill
                                </span>
						</a>
						<a href="BillController?action=list"
						   class="block w-full bg-white hover:bg-gray-50 text-gray-700 font-medium py-3 px-4 rounded-lg transition-colors duration-200 text-center border border-gray-300 hover:border-gray-400">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                                    </svg>
                                    View All Sales
                                </span>
						</a>
					</div>
				</div>
			</div>

			<!-- Quick Stats Section (Optional Enhancement) -->
			<div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6 max-w-4xl mx-auto">
				<div class="bg-white p-6 rounded-lg shadow-md text-center">
					<div class="text-3xl font-bold text-blue-600 mb-2">📊</div>
					<h4 class="text-lg font-semibold text-gray-700 mb-1">Analytics</h4>
					<p class="text-gray-500 text-sm">Track your performance</p>
				</div>
				<div class="bg-white p-6 rounded-lg shadow-md text-center">
					<div class="text-3xl font-bold text-green-600 mb-2">💰</div>
					<h4 class="text-lg font-semibold text-gray-700 mb-1">Revenue</h4>
					<p class="text-gray-500 text-sm">Monitor sales growth</p>
				</div>
				<div class="bg-white p-6 rounded-lg shadow-md text-center">
					<div class="text-3xl font-bold text-purple-600 mb-2">📚</div>
					<h4 class="text-lg font-semibold text-gray-700 mb-1">Inventory</h4>
					<p class="text-gray-500 text-sm">Manage stock levels</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div>
	<%@ include file ="footer.jsp"%>
</div>
</body>
</html>