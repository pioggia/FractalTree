private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public int h=147;
public int s= 125;
public int b = 150;
public int to = 115;
public int length = 500;
public int width = 500;
public double angle = 3*Math.PI/2;
public double wingspan = 100;
public void setup() 
{    
	colorMode(HSB);
	background(312, 135, 15);  
	size(length, width);  
} 
public void draw() 
{   
	fractal();
} 
public void fractal()
{ 
	stroke(h, s, b, to);   
	point(length/2, width/2);   
	drawBranches(length/2, width/2, wingspan, angle);
	wingspan += Math.random()*10-5;
	h += (int)Math.random()*10-1;
	s += (int)Math.random()*10-1;
	b += (int)Math.random()*20-1;
	to += (int)Math.random()*100-5;
}
void mouseClicked()
{
	drawBranches(length/2, width/2, wingspan/2, angle);
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double a1 = angle+Math.random()*branchAngle+Math.random()*50;
	double a2 = angle-Math.random()*branchAngle+Math.random()*50;
	branchLength = branchLength/fractionLength;
	int endx1 = (int)(branchLength*Math.cos(a1)+x);
	int endy1 = (int)(branchLength*Math.sin(a1)+y);
	int endx2 = (int)(branchLength*Math.cos(a2)+x);
	int endy2 = (int)(branchLength*Math.sin(a2)+y);
	line(x, y, endx1, endy1);
	line(x, y, endx2, endy2);
	if(branchLength > smallestBranch)
	{
		drawBranches(endx1, endy1, branchLength/2, Math.random()*a1);
		drawBranches(endx2, endy2, branchLength/2, Math.random()*a2);
	}
} 
