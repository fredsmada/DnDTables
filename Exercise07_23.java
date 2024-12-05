import java.util.*;
public class Exercise07_23 {
    public static void main(String[] args) {
        boolean lockers[] = new boolean[100];
        System.out.println("The open lockers are: ");
        for (int s = 1; s <100; s++) {
            for (int l = s-1; l <100; l += s) {
                //if (!lockers[l]) {
                    lockers[l] = !lockers[l];
                //}
            }
        }
        for (int i = 0; i <100; i++) {
            if (lockers[i] == true) {
                System.out.print(i + " ");
            }
        }
    }
}
