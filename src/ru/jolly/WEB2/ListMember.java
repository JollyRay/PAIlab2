package ru.jolly.WEB2;

public class ListMember {
    public ListMember(double x, double y, double r, long time){
        this.x = x;
        this.y = y;
        this.r= r;
        this.success = (x<=0 && y<=0 && x>=-r && y>=-r) || (x>=0 && y<=0 && y>=(x-r)/2) || (x>=0 && y>=0 && r*r/4>=x*x+y*y);
        this.time = System.currentTimeMillis() - time;
    }
    private double x, r;
    private long time;
    private boolean success;
    private double y;
    public boolean isSuccess() {
        return success;
    }
    public String getSuccess() {
        if (success)
            return "Hit";
        return "Miss";
    }

    public String getNormalTime() {
        return ((float)time)/1000 +"сек";
    }

    @Override
    public String toString() {
        return "ListMember{" +
                "x=" + x +
                ", r=" + r +
                ", time=" + time +
                ", success=" + success +
                ", y=" + y +
                '}';
    }

    public int getX() {
        return (int)Math.round(x);
    }

    public double getR() {
        return (int)Math.round(r);
    }

    public long getTime() {
        return time;
    }

    public double getY() {
        return y;
    }
}
