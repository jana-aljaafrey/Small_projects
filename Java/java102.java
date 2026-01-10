/*  
end-of-course-project
From: Satr Educational Academy
course: Java 102
about: A simple student management system that allows adding students, 
displaying their names and grades, and calculating the average grade.
*/
 



public class App {
      static String[] names = new String[10];
      static int[] grades = new int[10];
      static int students = 0;
    public static void main(String[] args) {
     System.out.println(average());
      add_student("Alice", 85);
      add_student("Bob", 90);
      add_student("Charlie", 78);
      display_names();
      System.out.println(average());
   
    }

    
  public static void add_student(String name, int grade) {
    try {
    names[students] = name;
    grades[students] = grade;
    students++;
    } catch (Exception e) {
      System.out.println("Cannot add more students");
   
    } 
    
  }
public static void display_names() {
      for (int i = 0; i < students; i++) {
        System.out.println("Name: " + names[i] + ", Grade: " + grades[i]);
     }
}

public static String average(){
  
      int sum = 0;
      for (int i = 0; i < students; i++){
        sum += grades[i];
      }
      try {
          int avg = sum / students;
          return "Average: " + avg;
      } catch (Exception e) {
        System.out.println("Cannot divide by zero");
        return "Average: 0";
      }

   
}

}

  
