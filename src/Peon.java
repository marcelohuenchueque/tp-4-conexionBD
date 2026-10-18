
public class Peon extends Pieza {
  
  public Peon(Movimiento movimiento, Comportamiento comportamiento, Color color, Estado estado, String descripcion,
      Casillero casilla) {
    super(movimiento, comportamiento, color, estado, descripcion, casilla);
  }


    @Override
    public void Mover(){
      System.out.println("se mueve 1 casilla hacia adelante");

    }

  @Override 
   public int obteneridTipoPieza() {
        return 6; 
   }
        
    
}
