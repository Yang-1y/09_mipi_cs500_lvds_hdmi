"""Run real RTL tests using Icarus Verilog. Python 3.8+, no third-party Python modules."""
import os, subprocess, pathlib, sys
root=pathlib.Path(__file__).resolve().parents[2]
build=root/'checks'/'sim_build';build.mkdir(parents=True,exist_ok=True)
rtl=sorted((root/'gesture/rtl').glob('*.v'))
iverilog=os.environ.get('IVERILOG','iverilog');vvp=os.environ.get('VVP','vvp')
args=[iverilog]
if os.environ.get('IVERILOG_LIB'): args+=['-B',os.environ['IVERILOG_LIB']]
log=[]
for tb in sorted((root/'gesture/tb').glob('tb_*.v')):
 out=build/(tb.stem+'.vvp')
 cmd=args+['-g2012','-Wall','-s',tb.stem,'-o',str(out)]+[str(p) for p in rtl]+[str(tb)]
 p=subprocess.run(cmd,capture_output=True,text=True)
 if p.returncode:print(p.stdout,p.stderr);sys.exit(p.returncode)
 p=subprocess.run([vvp,str(out)],capture_output=True,text=True,timeout=180,cwd=root)
 print(p.stdout,end='');log.append(p.stdout)
 if p.returncode:print(p.stderr);sys.exit(p.returncode)
(root/'checks'/'rtl_test_results.txt').write_text('Icarus Verilog RTL tests (synthetic inputs, not camera accuracy)\n'+''.join(log),encoding='utf-8')
