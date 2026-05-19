import pandas as pd

# Load raw dataset
df = pd.read_csv("retail_sales_dataset.csv")

print("ORIGINAL SHAPE")
print(df.shape)

# Drop null values
print("\nMissing values:", df.isnull().sum().sum())
df = df.dropna()

# Remove duplicates
print("Duplicates:", df.duplicated().sum())
df = df.drop_duplicates()

# Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

print("\nSTANDARDIZED COLUMNS")
print(df.columns.tolist())

# Convert date
df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d')
df['year'] = df['date'].dt.year
df['month'] = df['date'].dt.month
df['day'] = df['date'].dt.day
df['day_of_week'] = df['date'].dt.day_name()

print("\nDATE RANGE")
print("Min:", df['date'].min())
print("Max:", df['date'].max())

# Recalculate total_amount
df['total_amount'] = df['quantity'] * df['price_per_unit']

print("\nFINAL DATA TYPES")
print(df.dtypes)

print("\nFINAL DATASET PREVIEW")
print(df.head())

print("\nFINAL SHAPE")
print(df.shape)

# Save final cleaned dataset
df.to_csv("cleaned_sales.csv", index=False)
print("\nFinal cleaned dataset saved as cleaned_sales.csv!")

# Cleaning report
print("\nCLEANING REPORT")
print(f"Original rows:    1000")
print(f"Final rows:       {df.shape[0]}")
print(f"Rows removed:     {1000 - df.shape[0]}")
print(f"Original columns: 9")
print(f"Final columns:    {df.shape[1]}")
print(f"Final columns:    {', '.join(df.columns)}")

print("\nDay 7 complete - All work organized!")
