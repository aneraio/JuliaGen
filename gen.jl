using Dates

# Function to calculate gen value
function ts_to_gen(ts)
    gen = 1.0002 ^ ((ts - 1675084800) / 3300)
    return round(gen, digits=12)
end

# Get the current timestamp as Unix time
current_timestamp = Dates.datetime2unix(Dates.now())

# Calculate the gen value for the current timestamp
current_gen = ts_to_gen(current_timestamp)
println("G E N • N O W  $current_gen")