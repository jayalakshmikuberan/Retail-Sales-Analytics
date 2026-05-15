import pandas as pd

# Load cleaned dataset from Day 3
df = pd.read_csv("after_day3_cleaned.csv")

print("LOADED DATASET SHAPE")
print(df.shape)

# Original column names
print("\nORIGINAL COLUMN NAMES")
print(df.columns.tolist())

# Standardize column names to snake_case
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

print("\nSTANDARDIZED COLUMN NAMES")
print(df.columns.tolist())

# Check date column before conversion
print("\nDATE COLUMN DTYPE BEFORE")
print(df['date'].dtype)
print(df['date'].head())

# Convert date to datetime
df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d')

print("\nDATE COLUMN DTYPE AFTER")
print(df['date'].dtype)

print("\nDATE RANGE")
print("Min:", df['date'].min())
print("Max:", df['date'].max())

# Extract date components
df['year'] = df['date'].dt.year
df['month'] = df['date'].dt.month
df['day'] = df['date'].dt.day
df['day_of_week'] = df['date'].dt.day_name()

print("\nNEW DATE COLUMNS")
print(df[['date', 'year', 'month', 'day', 'day_of_week']].head())

# Verify all data types
print("\nFINAL DATA TYPES")
print(df.dtypes)

print("\nUPDATED DATASET PREVIEW")
print(df.head())

print("\nFINAL SHAPE")
print(df.shape)

# Save checkpoint
df.to_csv("after_day4_cleaned.csv", index=False)

print("\nDay 4 checkpoint saved!")
