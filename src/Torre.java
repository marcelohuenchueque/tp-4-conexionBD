public class Torre extends Pieza{
  


  public Torre(Movimiento movimiento, Comportamiento comportamiento, Color color, Estado estado, String descripcion,
      Casillero casilla) {
    super(movimiento, comportamiento, color, estado, descripcion, casilla);
  }

    @Override
    public void Mover(){
      System.out.println("se mueve en linea recta hacia la direccion que desee");

    }    

  @Override 
   public int obteneridTipoPieza() {
        return 3; 
   }
        
}
