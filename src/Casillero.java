enum ColorCasilla{
    blanco,negro
}

public class Casillero {
    private ColorCasilla  colorCasilla;
    private int    numCasilla;
    private int fila;
    private int columna;

    public ColorCasilla getColorCasilla() {
        return colorCasilla;
    }

    public void setColorCasilla(ColorCasilla colorCasilla) {
        this.colorCasilla = colorCasilla;
    }

    public int getNumCasilla() {
        return numCasilla;
    }

    public void setNumCasilla(int numCasilla) {
        this.numCasilla = numCasilla;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }
    
    public Casillero(ColorCasilla colorCasilla, int numCasilla, int fila, int columna) {
        this.colorCasilla = colorCasilla;
        this.numCasilla = numCasilla;
        this.fila = fila;
        this.columna = columna;
    }
    
    public Casillero(int numCasilla) {
        this.numCasilla = numCasilla;
    }

    @Override
    public String toString() {
        return  " "+colorCasilla+" " ;
    }

    public Casillero(ColorCasilla colorCasilla) {
        this.colorCasilla = colorCasilla;
    }    
    
}
