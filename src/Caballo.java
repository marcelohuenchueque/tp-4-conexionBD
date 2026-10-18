

public class Caballo extends Pieza{
  

  public Caballo(Movimiento movimiento, Comportamiento comportamiento, Color color, Estado estado, String descripcion,
      Casillero casilla) {
    super(movimiento, comportamiento, color, estado, descripcion, casilla);
  }

       @Override
    public void Mover(){
      System.out.println("se mueve en L");

    } 
  @Override 
   public int obteneridTipoPieza() {
        return 5; 
   }
        
}
