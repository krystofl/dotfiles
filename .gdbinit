python
import sys
sys.path.insert(0, '/home/krystof/libs/gdb-pretty-printers/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
