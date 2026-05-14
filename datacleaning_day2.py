import pandas as pd
import os

dataset_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "retail_sales_dataset.csv")
df = pd.read_csv(dataset_path)

# ---- 1. Dataset Shape ----
print(f"\nDataset Shape: {df.shape[0]} rows x {df.shape[1]} columns")

# ---- 2. Column Names ----
print(f"\nColumn Names:")
for i, col in enumerate(df.columns, 1):
    print(f"   {i}. {col}")

# ---- 3. Data Types ----
print(f"\nData Types:")
print(df.dtypes.to_string())

# ---- 4. First 5 Rows ----
print(f"\nFirst 5 Rows:")
print(df.head().to_string())

# ---- 5. Last 5 Rows ----
print(f"\nLast 5 Rows:")
print(df.tail().to_string())

# ---- 6. Dataset Info ----
print(f"\nDataset Info:")
print(df.info())

# ---- 7. Statistical Summary ----
print(f"\nStatistical Summary (Numeric Columns):")
print(df.describe().to_string())

# ---- 8. Unique values per column ----
print(f"\nUnique Values Per Column:")
for col in df.columns:
    print(f"   {col}: {df[col].nunique()} unique values")

# ---- 9. Check for missing values (preview) ----
print(f"\nMissing Values Preview:")
missing = df.isnull().sum()
print(missing.to_string())

# ---- 10. Column Analysis ----
print(f"\nColumn Analysis:")
print(f"   Date column type: {df['Date'].dtype} (needs conversion to datetime)")
print(f"   Date range: {df['Date'].min()} to {df['Date'].max()}")
print(f"   Product Categories: {df['Product Category'].unique()}")
print(f"   Gender values: {df['Gender'].unique()}")
print(f"   Age range: {df['Age'].min()} - {df['Age'].max()}")
print(f"   Quantity range: {df['Quantity'].min()} - {df['Quantity'].max()}")
print(f"   Price per Unit range: {df['Price per Unit'].min()} - {df['Price per Unit'].max()}")
print(f"   Total Amount range: {df['Total Amount'].min()} - {df['Total Amount'].max()}")