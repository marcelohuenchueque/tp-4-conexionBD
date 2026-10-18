enum Movimiento {
   tenue,sesgo_en_diagonal,encarnizo, directa, ladino ,sesgo_en_L    
}
enum Comportamiento {
   homérica, ligero, armada, postrero, oblicuo, agresor
}
enum Color{
    negro,blanco
}
enum Estado {
    libre, prisionero
}
public abstract class  Pieza {
    private Movimiento movimiento;
    private Comportamiento comportamiento;
    private Color color;
    private Estado estado;
    private String descripcion;
    private Casillero casilla;

    public Movimiento getMovimiento() {
        return movimiento;
    }
    public void setMovimiento(Movimiento movimiento) {
        this.movimiento = movimiento;
    }
    public Comportamiento getComportamiento() {
        return comportamiento;
    }
    public void setComportamiento(Comportamiento comportamiento) {
        this.comportamiento = comportamiento;
    }
    public Color getColor() {
        return color;
    }
    public void setColor(Color color) {
        this.color = color;
    }
    public Estado getEstado() {
        return estado;
    }
    public void setEstado(Estado estado) {
        this.estado = estado;
    }
        public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Casillero getCasilla() {
        return casilla;
    }
    public void setCasilla(Casillero casilla) {
        this.casilla = casilla;
    }

    public Pieza(Movimiento movimiento, Comportamiento comportamiento, Color color, Estado estado, String descripcion,
            Casillero casilla) {
        this.movimiento = movimiento;
        this.comportamiento = comportamiento;
        this.color = color;
        this.estado = estado;
        this.descripcion = descripcion;
        this.casilla = casilla;
    }

 
    
    @Override
    public String toString() {
        return this.getClass().getSimpleName() + " [movimiento = " + movimiento + ", comportamiento = " + 
        comportamiento + ", color = " + color + ", estado = " + estado + "]";
    }
    //obtener idcolor
    public int obteneridColor(){
        if ( this.color == Color.blanco) {
        return  1;}
         {
            return    2;
        }

    }
    //mover pieza
    public abstract void Mover();

    //obtener idTipoPieza
    public abstract int  obteneridTipoPieza();


}

 