USE Samples_Population
GO

---TASK 4---
declare @increased_population decimal(20,2) = 15000000000
declare @current_year_pupolation Decimal(20,2) = (Select sum(populationIn2020) from Populations)
declare @steady_growth_per_year decimal(10,2) = 0.01
--select CAST(Cast(sum(populationIn2020)-sum(PopulationIn2019) as decimal(10,2))/sum(populationIn2020) as decimal(10,2)) from populations --
declare @current_year INT = 2020;

while(@current_year_pupolation < @increased_population)
    begin
        set @current_year_pupolation = @current_year_pupolation + (@current_year_pupolation * @steady_growth_per_year)
        set @current_year = @current_year + 1
    end

Select @current_year as In_year
