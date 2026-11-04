"""Optional regeneration: Python + Pillow. Pass directory containing the six JPGs."""
from PIL import Image
from pathlib import Path
import sys
out=Path(__file__).parent/'photos';out.mkdir(exist_ok=True)
for k in range(6):
 f=next(Path(sys.argv[1]).glob(str(k)+'_*.jpg'))
 a=Image.open(f).convert('RGB').resize((240,135),Image.Resampling.NEAREST)
 (out/f'{k}.hex').write_text(''.join(f'{r:02x}{g:02x}{b:02x}\n' for r,g,b in a.getdata()))
