import pandas as pd

# Load dataset
df = pd.read_csv("retail_sales_dataset.csv")

print("ORIGINAL DATASET SHAPE")
print(df.shape)

# Check for null values
print("\nMISSING VALUES PER COLUMN")
print(df.isnull().sum())

# Percentage of missing values
print("\nPERCENTAGE OF MISSING VALUES")
print((df.isnull().sum() / len(df)) * 100)

# Display rows with missing values
print("\nROWS WITH MISSING VALUES")
print(df[df.isnull().any(axis=1)])

# Total missing values
print("\nTotal missing values:", df.isnull().sum().sum())

# Check for duplicates
print("\nDUPLICATE ROWS")
print("Duplicates found:", df.duplicated().sum())

# Remove duplicate rows
df = df.drop_duplicates()
print("Shape after removing duplicates:", df.shape)

# Check duplicate Transaction IDs
print("\nDUPLICATE TRANSACTION IDs")
print("Duplicate IDs:", df['Transaction ID'].duplicated().sum())

# Drop rows with any null values
df = df.dropna()

print("\nMISSING VALUES AFTER CLEANING")
print(df.isnull().sum())

print("\nCLEANED DATASET PREVIEW")
print(df.head())

print("\nFINAL DATASET SHAPE")
print(df.shape)

# Save cleaned dataset
df.to_csv("after_day3_cleaned.csv", index=False)

print("\nDay 3 checkpoint saved!")