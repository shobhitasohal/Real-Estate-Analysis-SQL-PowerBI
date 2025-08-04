
-- Creating a duplicate table for data cleaning

Select * 
from [project1].[dbo].[Nashville Housing];

--------------------------------------------------------------------------------------
-- Checking data in new table - Nashville_Housing_edited

Select * 
from Nashville_Housing_edited;

--------------------------------------------------------------------------------------

-- Checking if PropertyAddress is Null

Select UniqueID, ParcelID, PropertyAddress
from Nashville_Housing_edited
where PropertyAddress is null; --29 rows with null addresses.

--------------------------------------------------------------------------------------

-- Eliminating null values in Property Address

	--Step 1 - checking duplicate ParcelID & PropertyAddress
	with duplicate_row as (
	select *, row_number() over (partition by PropertyAddress order by UniqueID) as row_num
	from Nashville_Housing_edited)

	select UniqueID, ParcelID, PropertyAddress, row_num 
	from duplicate_row
	Order by ParcelID; 

	--Step 2 - Populating PropertyAddress where parcelID is same but address may be null

	select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress 
	from Nashville_Housing_edited a
	join Nashville_Housing_edited b on a.UniqueID<>b.UniqueID and a.ParcelID=b.ParcelID
	where a.PropertyAddress is null;

	--Step 3 - Replace Null values with Property Address
	
	update a
	set PropertyAddress=isnull(a.PropertyAddress,b.PropertyAddress)
	from Nashville_Housing_edited a
	join Nashville_Housing_edited b on a.UniqueID<>b.UniqueID and a.ParcelID=b.ParcelID
	where a.PropertyAddress is null;

--------------------------------------------------------------------------------------

-- Spilt PropertyAddress by delimiter " , " to extract city for visualizations in report

Alter table Nashville_Housing_edited
add StreetAddress Nvarchar(255);

update Nashville_Housing_edited
set StreetAddress =parsename(replace(PropertyAddress,',', '.'),2);

Alter table Nashville_Housing_edited
add city Nvarchar(255);

update Nashville_Housing_edited
set city =parsename(replace(PropertyAddress,',', '.'),1);

/*select propertyAddress,
parsename(replace(PropertyAddress,',', '.'),2) as StreetAddress,  
parsename(replace(PropertyAddress,',', '.'),1) as City
from Nashville_Housing_edited;*/

--------------------------------------------------------------------------------------

-- Standardize the 0/1 to Y/N in SoldAsVacant
	
ALTER TABLE Nashville_Housing_edited  
alter column SoldAsVacant VARCHAR(1);  


UPDATE Nashville_Housing_edited  
SET SoldAsVacant = CASE WHEN SoldAsVacant = '0' THEN 'N'  
					ELSE 'Y'   
					END;

select distinct SoldAsVacant, count(*) from Nashville_Housing_edited group by SoldAsVacant;
	
--------------------------------------------------------------------------------------
-- Checking & Eliminating Duplicate Rows in the data

	--Step 1- Verifying duplicate Rows 
	With duplicate_row as (
	select *, row_number() over (partition by ParcelID,LandUse,PropertyAddress, SaleDate, SalePrice,LegalReference, SoldASVacant, Acreage order by UniqueID) as row_num
	from Nashville_Housing_edited)

	select *
	from duplicate_row	
	where row_num>1
	order by ParcelID;

	/*
	select * 
	from Nashville_Housing_edited 
	where parcelID='119 13 0 183.00';*/
	
	-- Step 2 - Eliminating the duplicate rows
	With duplicate_row as (
	select *, row_number() over (partition by ParcelID,LandUse,PropertyAddress, 
											  SaleDate, SalePrice,LegalReference, 
											  SoldASVacant, Acreage order by UniqueID) 
											  as row_num
	from Nashville_Housing_edited)

	delete from duplicate_row
	where row_num>1;

--------------------------------------------------------------------------------------

-- Dropping columns not needed for further Analysis

Alter Table Nashville_Housing_edited
drop column OwnerName, OwnerAddress, TaxDistrict, PropertyAddress;

--------------------------------------------------------------------------------------
