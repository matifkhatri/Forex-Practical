#property link      "https://forexpractical.blogspot.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Yellow
#property indicator_color2 Yellow

extern int dist=24;
extern double arrowPosition=0.25;
extern bool AlertOn = true;
extern bool SendAnEmail=false;
double G_ibuf_88[];
double G_ibuf_92[];

int init() 
  {
   SetIndexStyle(0,DRAW_ARROW,STYLE_SOLID,2);
   SetIndexStyle(1,DRAW_ARROW,STYLE_SOLID,2);
   SetIndexArrow(1,225);
   SetIndexArrow(0,226);
   SetIndexBuffer(0,G_ibuf_88);
   SetIndexBuffer(1,G_ibuf_92);
   return (0);
  }

int start() 
  {
   int highest_20;
   int lowest_24;
   int Li_0=IndicatorCounted();
   if(Li_0 < 0) return (-1);
   if(Li_0>0) Li_0--;
   int Li_16=Bars-Li_0-1;
   Li_16=MathMax(Li_16,dist);
   if(Li_16<0) Li_16=0;
   for(int Li_8=Li_16; Li_8>=0; Li_8--) 
     {
      highest_20= iHighest(NULL,0,MODE_HIGH,dist,Li_8-dist/2);
      lowest_24 = iLowest(NULL,0,MODE_LOW,dist,Li_8-dist/2);
      if(Li_8==highest_20) G_ibuf_88[Li_8]=High[highest_20]+iATR(NULL,0,10,Li_8)*arrowPosition;
      else G_ibuf_88[Li_8]=EMPTY_VALUE;
      if(Li_8==lowest_24) G_ibuf_92[Li_8]=Low[lowest_24]-iATR(NULL,0,10,Li_8)*arrowPosition;
      else G_ibuf_92[Li_8]=EMPTY_VALUE;
     }
   return (0);
  }
