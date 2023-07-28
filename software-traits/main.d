import std.math;
import std.stdio;
import gamut;

string[] rawData = [
    "H- D+ U+ Q- S- B+ F- T- R- C+ U- P+ M= N+ E-",
    "H+ D= U= Q+ S+ B+ F+ T+ R- C- U+ P- M+ N- E+",
    "H- D= U- Q+ S+ B- F+ T= R- C+ U+ P- M= N+ E-",
    "H+ D= U= Q= S+ B- F+ T= R- C+ U- P+ M+ N= E+",
    "H- D- U- Q+ S- B- F+ T- R+ C+ U- P+ M- N- E+",
    "H+ D- U+ Q+ S+ B- F+ T- R+ C- U- P+ M- N- E+",
    "H- D- U- Q= S- B+ F= T+ R= C= U- P+ M- N- E-",
    "H- D= U- Q- S+ B- F- T- R- C- U- P+ M- N= E-",
    "H- D+ U+ Q- S+ B+ F- T+ R- C+ U+ P- M= N+ E-",
    "H- D= U- Q+ S+ B- F+ T- R- C+ U+ P- M= N+ E-",
    "H- D- U+ Q- S- B+ F- T- R- C+ U- P+ M- N= E-",
    "H- D- U- Q- S+ B+ F- T+ R= C- U+ P+ M- N- E-",
    "H+ D- U+ Q+ S- B- F- T+ R+ C+ U- P+ M- N- E+",
    "H- D= U- Q= S+ B- F- T- R- C+ U- P+ M+ N- E+",
];

enum string TRAITS = "HDUQSBFTRCUPMNE";
enum int NUM_TRAITS = cast(int) TRAITS.length;
pragma(msg, NUM_TRAITS, " traits");

struct Row
{
    float[NUM_TRAITS] factor;
}

void main()
{
    Row[] rows = parseData(rawData);

    int W = NUM_TRAITS;
    int H = cast(int)rows.length;
    Image image;
    image.create(W, H, PixelType.rgba8);

    assert(image.type == PixelType.rgba8);
    assert(image.hasData());
    for (int y = 0; y < image.height(); ++y)
    {
        ubyte* scan = cast(ubyte*) image.scanptr(y);
        for (int x = 0; x < image.width(); ++x)
        {
            float factor = rows[y].factor[x];
            assert(!isNaN(factor));
            ubyte r, g, b;
            if (factor > 0)  // green => positive
            {
                r = cast(ubyte)(0.5f+255*(1-factor));
                g = 255;
                b = cast(ubyte)(0.5f+255*(1-factor));
            }
            else
            {
                r = 255;
                g = cast(ubyte)(0.5f+255*(1-factor));
                b = cast(ubyte)(0.5f+255*(1-factor));
            }
            scan[4*x + 0] = r;
            scan[4*x + 1] = g;
            scan[4*x + 2] = b;
            scan[4*x + 3] = 255;
        }
    }
    image.saveToFile("output.png");    
}


Row[] parseData(string[] data)
{
    Row[] r;

    foreach(n; 0..data.length)
    {
        Row row;
        for (int t = 0; t < NUM_TRAITS; ++t)
        {
            char ch = data[n][1+t*3];
            if (ch == '-')
                row.factor[t] = -1;
            else if (ch == '+')
                row.factor[t] = 1;
            else if (ch == '=')
                row.factor[t] = 0;
            else 
                assert(false);

        }
        r~=row;
    }
    return r;
}