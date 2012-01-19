import sort

if __name__ == "__main__":
	file = '/Users/jga/Dropbox/Notes/personal.taskpaper'
	file = '/tmp/test.taskpaper'
	file = '/Users/jga/Dropbox/Notes/projects/Kindspark.taskpaper'
	f = open(file, 'r').read()
	lines = f.split('\n')
	node = sort.parse_tasks(lines);
	sort.sort_tasks(node)
	sort.print_tasks(node)

