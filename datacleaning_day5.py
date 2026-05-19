import pandas as pd
import numpy as np

# Load cleaned dataset from Day 4
df = pd.read_csv("after_day4_cleaned.csv")
df['date'] = pd.to_datetime(df['date'])

print("LOADED DATASET SHAPE")
print(df.shape)

# Check for missing values
print("\nMISSING VALUES CHECK")
print(df.isnull().sum())
print("\nTotal missing values:", df.isnull().sum().sum())

# Fill numeric nulls with median
for col in df.select_dtypes(include=[np.number]).columns:
    if df[col].isnull().sum() > 0:
        df[col] = df[col].fillna(df[col].median())
        print(f"Filled {col} with median: {df[col].median()}")

# Fill categorical nulls with mode
for col in df.select_dtypes(include=['object']).columns:
    if df[col].isnull().sum() > 0:
        df[col] = df[col].fillna(df[col].mode()[0])
        print(f"Filled {col} with mode: {df[col].mode()[0]}")

print("\nMISSING VALUES AFTER HANDLING")
print(df.isnull().sum())

# Validate data
print("\nDATA VALIDATION")
print("Negative quantities:", (df['quantity'] < 0).sum())
print("Zero quantities:", (df['quantity'] == 0).sum())
print("Negative prices:", (df['price_per_unit'] < 0).sum())
print("Negative totals:", (df['total_amount'] < 0).sum())

# Validate total_amount = quantity * price_per_unit
df['calculated'] = df['quantity'] * df['price_per_unit']
mismatched = (df['total_amount'] != df['calculated']).sum()
print("Total amount mismatches:", mismatched)

if mismatched > 0:
    df['total_amount'] = df['calculated']
    print("Fixed total_amount = quantity * price_per_unit")

df = df.drop(columns=['calculated'])

# Check value ranges
print("\nGender values:", df['gender'].unique())
print("Product categories:", df['product_category'].unique())
print("Age range:", df['age'].min(), "-", df['age'].max())

print("\nCLEANED DATASET PREVIEW")
print(df.head())

print("\nFINAL SHAPE")
print(df.shape)

# Save final cleaned dataset
df.to_csv("cleaned_sales.csv", index=False)

print("\nCleaned dataset saved as cleaned_sales.csv!")
