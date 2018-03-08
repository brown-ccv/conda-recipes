#!/usr/bin/env python
import sys,os,  subprocess as sp

def real_dirname(path):
        """Return the symlink-resolved, canonicalized directory-portion of path."""
        return os.path.dirname(os.path.realpath(path))

def main():
        args=' '.join(sys.argv[1:])
        jar_dir = real_dirname(sys.argv[0])
        #if args.find("Xmx") > 0:
	if args.find("Xmx") > 0:
        	args=' '.join(sys.argv[2:])
        	cmd = "java " + ' '.join([sys.argv[1], "-classpath ",
							os.path.join(jar_dir,"qualimap.jar") + ":" + os.path.join(jar_dir,"lib/*"), 
							"org.bioinfo.ngs.qc.qualimap.main.NgsSmartMain",
							 args])
	else:
        	cmd = "java " + ' '.join(["-Xmx1024M","-classpath ",
					os.path.join(jar_dir,"qualimap.jar") + ":" + os.path.join(jar_dir,"lib/*"), 
					"org.bioinfo.ngs.qc.qualimap.main.NgsSmartMain",
					args])
        print cmd
	sp.call(cmd, shell=True)

if __name__ == '__main__':
    main()
