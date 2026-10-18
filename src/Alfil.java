

public class Alfil extends Pieza{
  


  public Alfil(Movimiento movimiento, Comportamiento comportamiento, Color color, Estado estado, String descripcion,
      Casillero casilla) {
    super(movimiento, comportamiento, color, estado, descripcion, casilla);
  }

        @Override
    public void Mover(){
      System.out.println("se mueve en diagonal");

    }
  @Override 
   public int obteneridTipoPieza() {
        return 4; 
   }
    
}
