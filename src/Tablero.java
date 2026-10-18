

public class Tablero{
    private Casillero[][] untablero;

    public Tablero() {
        untablero = new Casillero[8][8];

    for (int fila = 0; fila < 8; fila++) {
            for (int col = 0; col < 8; col++) {
                
                // Si la suma de fila + columna es divisible por 2 (es par)
                if ((fila + col) % 2 == 0) {
                    untablero[fila][col] = new Casillero(ColorCasilla.blanco);
                } else {
                    untablero[fila][col] = new Casillero(ColorCasilla.negro);
                }
                
            }
        }        
    }
    public Casillero[][] getUntablero() {
        return untablero;
    }
    public void setUntablero(Casillero[][] untablero) {
        this.untablero = untablero;
    }
    //metodos
    public void MostrarTablero(){
        int fila,colum;
        for(fila = 0; fila < 8; fila++){
            System.out.print("[ ");
            for(colum = 0; colum < 8; colum++){     
               System.out.print(untablero[fila][colum]);
            }
            System.out.println("]");
        }
    }



    
}
