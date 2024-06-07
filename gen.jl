using Gtk, Dates

# Function to calculate gen value
function ts_to_gen(ts)
    gen = 1.0002 ^ ((ts - 1675084800) / 3300)
    return round(gen, digits=12)
end

# Create a window
win = GtkWindow("T H E   T R E E S", 400, 100)

# Create a label to display the gen value
label = GtkLabel("Initializing...")
push!(win, label)

# Function to update the label with the current gen value
function update_gen_label()
    current_timestamp = Dates.datetime2unix(Dates.now())
    current_gen = ts_to_gen(current_timestamp)
    set_gtk_property!(label, :label, "G E N • N O W  $current_gen")
end

# Set up a timer to update the gen value every second
function start_timer()
    Base.Timer(1.0, interval=1.0) do _ 
        update_gen_label()
    end
end

# Start the timer
start_timer()

# Show the window
showall(win)

# Start the Gtk event loop
Gtk.main()
