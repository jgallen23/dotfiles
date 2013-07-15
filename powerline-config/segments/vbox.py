
from powerline.lib.threaded import ThreadedSegment, KwThreadedSegment, with_docstring
import subprocess

def log(msg):
		f = open('/tmp/test', 'w')
		f.write(str(msg))
		f.close()

class VMsRunningSegment(ThreadedSegment):
	interval = 600

	def update(self, *args):
		subprocess.check_output(['touch', '/tmp/test'])
		out = subprocess.check_output(['/usr/bin/VBoxManage', 'list', 'runningvms'])
		return out

	def render(self, out, **kwargs):
		count = len(out.split('\n')) - 1
		return [{'contents': 'Running VMs: '+str(count) }]


vms_running = with_docstring(VMsRunningSegment(), 
'''
Returns the number of running Virtual Box Machines.
'''
)
