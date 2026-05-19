import pandas as pd

# Load cleaned dataset
df = pd.read_csv("cleaned_sales.csv")
df['date'] = pd.to_datetime(df['date'])

print("DATASET SHAPE")
print(df.shape)

# Summary statistics
print("\nSUMMARY STATISTICS")
print(df.describe())

# Sales by product category
print("\nSALES BY PRODUCT CATEGORY")
cat_stats = df.groupby('product_category').agg(
    total_sales=('total_amount', 'sum'),
    avg_sale=('total_amount', 'mean'),
    num_transactions=('transaction_id', 'count'),
    avg_quantity=('quantity', 'mean')
).round(2)
print(cat_stats)

# Sales by gender
print("\nSALES BY GENDER")
gender_stats = df.groupby('gender').agg(
    total_sales=('total_amount', 'sum'),
    avg_sale=('total_amount', 'mean'),
    num_transactions=('transaction_id', 'count')
).round(2)
print(gender_stats)

# Monthly sales trend
print("\nMONTHLY SALES TREND")
monthly = df.groupby('month').agg(
    total_sales=('total_amount', 'sum'),
    num_transactions=('transaction_id', 'count')
).round(2)
print(monthly)

# Age group analysis
print("\nAGE GROUP ANALYSIS")
bins = [17, 25, 35, 45, 55, 65]
labels = ['18-25', '26-35', '36-45', '46-55', '56-65']
df['age_group'] = pd.cut(df['age'], bins=bins, labels=labels)
age_stats = df.groupby('age_group', observed=True).agg(
    total_sales=('total_amount', 'sum'),
    avg_sale=('total_amount', 'mean'),
    count=('transaction_id', 'count')
).round(2)
print(age_stats)

# Top 10 customers by spending
print("\nTOP 10 CUSTOMERS BY SPENDING")
top_customers = df.groupby('customer_id')['total_amount'].sum().sort_values(ascending=False).head(10)
print(top_customers)

# Sales by day of week
print("\nSALES BY DAY OF WEEK")
dow_stats = df.groupby('day_of_week').agg(
    total_sales=('total_amount', 'sum'),
    avg_sale=('total_amount', 'mean'),
    count=('transaction_id', 'count')
).round(2)
print(dow_stats)

# Price per unit distribution
print("\nPRICE PER UNIT VALUE COUNTS")
print(df['price_per_unit'].value_counts().sort_index())

df = df.drop(columns=['age_group'])

print("\nDay 6 analysis complete!")
