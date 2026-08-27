-- Sub-pergunta 1: Categorias com mais vendas e lucro
SELECT Category, 

ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit

FROM `project-9c439003-6f06-45d6-91b.Retail_Analysis.superstore_sales`

GROUP BY Category
ORDER BY Total_Sales DESC

-- Sub-pergunta 2: Sazonalidade mensal
SELECT `Order Month`,

ROUND(SUM(Sales), 2) AS Total_Sales

FROM `project-9c439003-6f06-45d6-91b.Retail_Analysis.superstore_sales`

GROUP BY `Order Month`
ORDER BY MIN(`Order Date`);

-- Sub-pergunta 3: Frequência de compra vs valor por sub-categoria
SELECT `Sub-Category`,

COUNT(DISTINCT `Order ID`) AS Num_Orders,

SUM(Quantity) AS Total_Quantity,
ROUND(SUM(Sales), 2) AS Total_Sales,

ROUND(SUM(Quantity) / COUNT(DISTINCT `Order ID`), 2) AS Avg_Qty_Per_Order

FROM `project-9c439003-6f06-45d6-91b.Retail_Analysis.superstore_sales`

GROUP BY `Sub-Category`
ORDER BY Avg_Qty_Per_Order ASC;

-- Sub-pergunta 4: Vendas, encomendas e shipping por região
SELECT Region,

  ROUND(SUM(Sales),2) AS Total_Sales,
  COUNT(DISTINCT `Order ID`) AS Total_Orders,
  ROUND(AVG(`Shipping Days`), 2) AS Avg_Shipping_Days

FROM `project-9c439003-6f06-45d6-91b.Retail_Analysis.superstore_sales`

GROUP BY Region
ORDER BY Total_Sales DESC;
