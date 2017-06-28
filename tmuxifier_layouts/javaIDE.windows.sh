# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Projects/bank-payee-rs/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "javaIDE"

# Split window into panes.
split_h 20
split_v 66
split_v 50
select_pane 0
split_v 20

# Run commands.
run_cmd "vim ." 0   	# runs in active pane
run_cmd "git log" 1  	# runs in pane 1
run_cmd "htop" 2 # runs in pane 2
#run_cmd "tree ." 3  	# runs in pane 3
#run_cmd "htop" 4  	# runs in pane 4

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
