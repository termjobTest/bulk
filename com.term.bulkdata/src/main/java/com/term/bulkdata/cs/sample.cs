using NStack;
using System;
using System.Collections.Generic;
using System.Diagnostics;


static class Demo {
	class Box10x : View {
		int w = 40;
		int h = 50;

		public bool WantCursorPosition { get; set; } = false;

		public Box10x (int x, int y) : base (new Rect (x, y, 20, 10))
		{
		}

		public Size GetContentSize ()
		{
			return new Size (w, h);
		}

		public void SetCursorPosition (Point pos)
		{
			throw new NotImplementedException ();
		}

		public override void Redraw (Rect bounds)
		{
			//Point pos = new Point (region.X, region.Y);
			Driver.SetAttribute (ColorScheme.Focus);

			for (int y = 0; y < h; y++) {
				Move (0, y);
				Driver.AddStr (y.ToString ());
				for (int x = 0; x < w - y.ToString ().Length; x++) {
					//Driver.AddRune ((Rune)('0' + (x + y) % 10));
					if (y.ToString ().Length < w)
						Driver.AddStr (" ");
				}
			}
			//Move (pos.X, pos.Y);
		}
	}

	class Filler : View {
		int w = 40;
		int h = 50;

		public Filler (Rect rect) : base (rect)
		{
			w = rect.Width;
			h = rect.Height;
		}

		public Size GetContentSize ()
		{
			return new Size (w, h);
		}

		public override void Redraw (Rect bounds)
		{
			Driver.SetAttribute (ColorScheme.Focus);
			var f = Frame;
			w = 0;
			h = 0;

			for (int y = 0; y < f.Width; y++) {
				Move (0, y);
				var nw = 0;
				for (int x = 0; x < f.Height; x++) {
					Rune r;
					switch (x % 3) {
					case 0:
						var er = y.ToString ().ToCharArray (0, 1) [0];
						nw += er.ToString ().Length;
						Driver.AddRune (er);
						if (y > 9) {
							er = y.ToString ().ToCharArray (1, 1) [0];
							nw += er.ToString ().Length;
							Driver.AddRune (er);
						}
						r = '.';
						break;
					case 1:
						r = 'o';
						break;
					default:
						r = 'O';
						break;
					}
					Driver.AddRune (r);
					nw += Rune.RuneLen (r);
				}
				if (nw > w)
					w = nw;
				h = y + 1;
			}
		}
	}