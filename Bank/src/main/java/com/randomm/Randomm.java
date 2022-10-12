package com.randomm;

import java.util.Random;

public class Randomm{
    public long getRandom() {
        Random rnd = new Random();
        long number = 1000000000000L + Math.abs(rnd.nextLong());
        String s = String.format("%13d", number);
        s = s.substring(0,13);
        return Long.parseLong(s);
    }
}