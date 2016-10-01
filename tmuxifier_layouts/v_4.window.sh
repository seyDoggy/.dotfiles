# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Development"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "v_4"

# Split window into panes.
split_h 20
split_v 66
split_v 50

# Run commands.
#run_cmd "vim ." 0   	# runs in active pane
#run_cmd "git log" 1  	# runs in pane 1
#run_cmd "gulp serve" 2 # runs in pane 2
#run_cmd "htop" 3  	# runs in pane 3

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
