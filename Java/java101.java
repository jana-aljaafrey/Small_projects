/*  
end-of-course-project
From: Satr Educational Academy
course: Java 101
about: A simple BMI calculator that takes height and weight
 as input then calculates the BMI
 and displays a category based on the calculated BMI.
*/
 


import java.util.Locale;
import java.util.Scanner;


public class App {
    public static void main(String[] args) throws Exception {
        Scanner s = new Scanner(System.in);
        System.out.println("Welcome here is a BMI calculator");
        System.out.print("Enter your height in m: ");
        String height = s.nextLine();
        System.out.print("Enter your weight in kg: ");
        String weight = s.nextLine();

        double bmi = Double.parseDouble(weight) / (Double.parseDouble(height) * (Double.parseDouble(height)));
        System.out.println("Your BMI Is: " +  String.format(Locale.US, "%.2f", bmi) + " And Based on The Calculated BMI You Have: " + sortBMI(Double.parseDouble(weight), Double.parseDouble(height)));


    }

    public static String sortBMI(double weight, double height)  {
     double bmi = weight / (height * height);
       if (bmi < 18.5) {
          return "Underweight";
       }
       else if (bmi >= 18.5 && bmi <= 24.9) {
         return "Normal Weight";
       }
       else if (bmi >= 25 && bmi <= 29.9) {
         return "Overweight";
       }
       else {
         return "Obese";
       }
}

    }
