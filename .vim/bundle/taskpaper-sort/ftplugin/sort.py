import re

class Node(object):
	def get_indent_count(self):
		i = 0
		for c in self.text:
			if c == "\t":
				i += 1
			else:
				break
		return i

	def get_priority(self):
		p = re.search("\((\d)\)", self.text)
		if p:
			return int(p.groups()[0])
		else:
			return 99

	def __init__(self, text):
		self.text = text
		self.indent = self.get_indent_count()
		self.priority = self.get_priority()
		self.complete = True if len(re.findall('@done', text)) == 1 else False
		self.children = []


	def add_child(self, child):
		self.children.append(child)
		child.parent_node = self

	def __str__(self):
		return "%s Indent: %i Children: %i" % (self.text, self.indent, len(self.children))


def parse_tasks(lines):
	root = Node('') 
	root.indent = -1
	last_node = root
	for line in lines:
		if not line:
			continue
		node = Node(line)
		if node.indent > last_node.indent:
			last_node.add_child(node)
		else:
			parent_node = last_node
			while parent_node.indent != (node.indent - 1):
				parent_node = parent_node.parent_node

			parent_node.add_child(node)
		last_node = node
	return root

def sort_tasks(node):
	def sort(a, b):
		c = cmp(a.complete, b.complete)
		if c == 0 and not a.complete:
			c = cmp(a.priority, b.priority)
		return c

	node.children = sorted(node.children, cmp=sort)
	for child in node.children:
		sort_tasks(child)

def flatten_tasks(node):
	txt = []
	if node.text:
		txt.append(node.text)
	for child in node.children:
		txt.append(flatten_tasks(child))
	return '\n'.join(txt)

def print_tasks(node):
	txt = flatten_tasks(node)
	print txt

#if __name__ == "__main__":
	#return
	#file = '/Users/jga/Dropbox/Notes/personal.taskpaper'
	##file = '/tmp/test.taskpaper'
	#f = open(file, 'r').read()
	#lines = f.split('\n')
	#node = parse_tasks(lines);
	#sort_tasks(node)
	#print_tasks(node)

