public class Reina extends Pieza{
  
  public Reina(Movimiento movimiento, Comportamiento comportamiento, Color color, Estado estado, String descripcion,
      Casillero casilla) {
    super(movimiento, comportamiento, color, estado, descripcion, casilla);
  }


        @Override
    public void Mover(){
      System.out.println("se mueve en todas las direcciones");

    }

  @Override 
   public int obteneridTipoPieza() {
        return 1; 
   }
    
}
