    String yourString = "";
    int[] allChars = new int[yourString.length()];
    for (i = startY; i <= endY; i++) {
        yourString = boom_location[i];
        for (int t = startX; t <= endX; t++) {
            println(yourString.charAt(t));
            if (yourString.charAt(t) == '1') { // Change the comparison to char '1'
                count += 1;
            }
            println("count" + count);
        }
    }