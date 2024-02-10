# Ben-s-Pizzeria

Medium - https://medium.com/@vishveshdhobe/analyzing-pizzeria-data-a-data-analysis-case-study-a7ffbe4c1f2b

Schema -

![QuickDBD-export (1)](https://github.com/VishveshDhobe/Ben-s-Pizzeria/assets/49454317/6f935d18-1407-4329-bd68-bfaf4743a20a)

The provided SQL queries involve data analysis for different dashboards in a business, likely related to a pizzeria or restaurant. Here's a short description of the work done in each query:

Dashboard 1: Order and Sales Analysis This dashboard focuses on analyzing order and sales data. It retrieves information such as order ID, item price, quantity, item category, item name, creation date, delivery address details, and delivery status. The query joins the "orders" table with the "item" and "address" tables to provide insights into total orders, total sales, average order value, sales by category, top-selling items, orders by hour, sales by hour, and orders by delivery address.

Dashboard 2: Ingredient Cost and Stock Analysis This dashboard deals with ingredients used in pizza preparation and their associated costs. It calculates the total quantity of ingredients used, the total cost of ingredients, the calculated cost of pizzas based on ingredient costs, and the percentage of remaining stock for each ingredient. The query involves multiple joins between the "orders," "item," "recipe," and "ingredient" tables. It also creates a view named "stock1" to continue querying ingredient-related data.

Dashboard 3: Staff and Hours Analysis The third dashboard focuses on staff-related analysis, including staff costs and hours worked. It retrieves information from the "rota," "staff," and "shift" tables. The query provides details such as the date, first name, last name, hourly rate, start time, end time, hours worked in a shift, and staff cost for each shift. This analysis can be used to understand total staff costs, total hours worked, and staff details summaries.

Overall, these queries enable insights into various aspects of the business, ranging from sales and order patterns to ingredient costs and staffing efficiency. The data extracted can be used to make informed decisions and optimizations within the restaurant or pizzeria operations.
