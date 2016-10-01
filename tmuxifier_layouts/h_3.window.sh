# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Development"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "h_3"

# Split window into panes.
split_v 20
split_h 33

# Run commands.
#run_cmd "vim ." 0    	# runs in active pane
#run_cmd "git log" 1  	# runs in pane 2
#run_cmd "htop" 2  	# runs in pane 2

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
