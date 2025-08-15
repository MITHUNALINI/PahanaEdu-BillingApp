<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.pahanaedu.model.Book, com.pahanaedu.model.Customer" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Bill</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-wrap justify-center p-6">

<div class="bg-white shadow-lg rounded-lg max-w-4xl w-full p-8">
    <h3 class="text-3xl font-semibold text-gray-800 mb-6 border-b pb-2">Create New Bill</h3>

    <form method="post" action="BillController" onsubmit="updateItemsField()" class="space-y-8">

        <div class="space-y-2">
            <label for="customer" class="block text-gray-700 font-medium">Select Customer</label>
            <select name="customer" id="customer" required
                    class="block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3
                           focus:ring-indigo-500 focus:border-indigo-500 transition duration-150">
                <option value="">-- Choose Customer --</option>
                <%
                    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                    if (customers != null) {
                        for (Customer c : customers) {
                %>
                <option value="<%= c.getAccountNumber() %>">
                    <%= c.getAccountNumber() %> - <%= c.getName() %>
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <hr class="border-gray-300">

        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
        %>

        <% for (int i = 1; i <= 4; i++) { %>
        <div class="grid grid-cols-12 gap-4 items-end">
            <div class="col-span-5">
                <label class="block text-gray-700 font-medium mb-1">Book <%= i %></label>
                <select class="book-select w-full border border-gray-300 rounded-md py-2 px-3
                               focus:ring-indigo-500 focus:border-indigo-500 transition duration-150"
                        name="book<%= i %>" onchange="updatePrice(this)">
                    <option value="">-- Select Book --</option>
                    <% if (books != null) {
                        for (Book b : books) { %>
                    <option value="<%= b.getId() %>" data-price="<%= b.getPrice() %>"><%= b.getTitle() %></option>
                    <% } } %>
                </select>
            </div>

            <div class="col-span-2">
                <label class="block text-gray-700 font-medium mb-1">Qty</label>
                <input type="number" min="0" name="qty<%= i %>" class="quantity-input w-full border border-gray-300 rounded-md py-2 px-3
                         focus:ring-indigo-500 focus:border-indigo-500 transition duration-150"
                       onchange="updateTotal(this)">
            </div>

            <div class="col-span-3">
                <label class="block text-gray-700 font-medium mb-1">Unit Price</label>
                <input type="text" readonly class="unit-price readonly w-full bg-gray-100 border border-gray-300 rounded-md py-2 px-3 text-gray-600 font-mono" name="unitPrice<%= i %>">
            </div>

            <div class="col-span-2">
                <label class="block text-gray-700 font-medium mb-1">Total</label>
                <input type="text" readonly class="book-total readonly w-full bg-gray-100 border border-gray-300 rounded-md py-2 px-3 text-gray-600 font-mono" name="bookTotal<%= i %>">
            </div>
        </div>
        <% } %>

        <input type="hidden" id="items" name="items" value="">

        <div class="flex justify-end items-center space-x-4 mt-6">
            <label for="grandTotal" class="font-semibold text-lg text-gray-700">Grand Total (LKR)</label>
            <input type="text" id="grandTotal" name="grandTotal" readonly
                   class="readonly font-bold w-40 bg-gray-100 border border-gray-300 rounded-md py-2 px-4 text-right text-lg text-indigo-600"/>
            <input type="hidden" id="user" name="user" value="<%= username %>">
        </div>

        <div class="flex justify-center mt-8">
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-3 px-10 rounded-md shadow-md transition duration-300">
                Generate Bill
            </button>
        </div>
    </form>
</div>

<script>
    function formatNumber(num) {
        return parseFloat(num).toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
    }

    function updatePrice(select) {
        const price = select.options[select.selectedIndex].getAttribute('data-price');
        const row = select.closest('.grid');
        const unitPriceInput = row.querySelector('.unit-price');
        const qtyInput = row.querySelector('.quantity-input');
        const totalInput = row.querySelector('.book-total');

        if (price) {
            unitPriceInput.value = formatNumber(price);
            updateTotal(qtyInput);
        } else {
            unitPriceInput.value = '';
            totalInput.value = '';
            updateGrandTotal();
        }
    }

    function updateTotal(qtyInput) {
        const row = qtyInput.closest('.grid');
        const unitPriceStr = row.querySelector('.unit-price').value.replace(/,/g, '');
        const unitPrice = parseFloat(unitPriceStr) || 0;
        const quantity = parseInt(qtyInput.value) || 0;
        const total = unitPrice * quantity;
        row.querySelector('.book-total').value = formatNumber(total);
        updateGrandTotal();
    }

    function updateGrandTotal() {
        let grandTotal = 0;
        document.querySelectorAll('.book-total').forEach(input => {
            const val = input.value.replace(/,/g, '');
            grandTotal += parseFloat(val) || 0;
        });
        document.getElementById('grandTotal').value = formatNumber(grandTotal);
    }

    function updateItemsField() {
        const selected = [];

        document.querySelectorAll('.grid').forEach(row => {
            const sel = row.querySelector('.book-select');
            const qty = row.querySelector('.quantity-input');

            if (!sel || !qty) return;

            const opt = sel.options[sel.selectedIndex];
            const q   = parseInt(qty.value);

            if (opt && opt.value !== "" && q > 0) {
                selected.push(opt.text + '(qty-' + q + ')');
            }
        });

        document.getElementById('items').value = selected.join(', ');
    }

    document.querySelectorAll('.book-select').forEach(s =>
        s.addEventListener('change', updateItemsField));
    document.querySelectorAll('.quantity-input').forEach(q =>
        q.addEventListener('input', updateItemsField));

</script>

</body>
</html>
