/**
 * Label: Label Class
 * October 15, 2014
 *
 * @author Tyler Mau
 * @version 1.0
 */

public class Label {

   private String label;
   private int addr;

   public Label () {

   }

   public Label(String label, int addr) {
      this.label = label;
      this.addr = addr;
   }

   public String getLabel() {
      return label;
   }

   public int getAddr() {
      return addr;
   }

}
