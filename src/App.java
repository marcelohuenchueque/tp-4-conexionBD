import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.time.LocalDate;
public class App {
    public static void main(String[] args) throws Exception {
        crearPiezas();
        //mostrarPiezasBD();
        mostrarPiezasBD();
	}
	public static  void insertarPieza(Pieza pieza){	
	    String sql = """
		     INSERT INTO pieza (`Descripcion`,`idColor`,`idTipoPieza`,`idCasillero`,`Movimiento`,
		    `Comportamiento`,`Estado`,`Fecha_Creacion`) VALUES (?,?,?,?,?,?,?,?) 
						""";
	    AccesoDatos accesoBD = null;
    	Connection con = null;
    	PreparedStatement sent = null;
		//ResultSet rs = null;	
        try {
			// Instancio un objeto de acceso a datos
        	accesoBD = new AccesoDatos();
			//conectar
			accesoBD.conectar();
            //Obtener la conexion para poder generar la sentencia de consulta
            con = accesoBD.getConexion();
            sent = con.prepareStatement(sql);
			
			int idColor = pieza.obteneridColor();
			int idTipoPieza = pieza.obteneridTipoPieza();

			LocalDate fechaHoy = LocalDate.now();

			//asignar los parametros en la consulta 
            sent.setString(1,pieza.getDescripcion());
			sent.setInt(2,idColor);
			sent.setInt(3,idTipoPieza);
			sent.setInt(4,pieza.getCasilla().getNumCasilla());
			sent.setString(5,pieza.getMovimiento().name());
			sent.setString(6,pieza.getComportamiento().name());
			sent.setString(7,pieza.getEstado().name());
			sent.setDate(8,java.sql.Date.valueOf(fechaHoy));

			sent.executeUpdate();
            System.out.println("pieza insertada con exito. ");
		} catch (SQLException e) {
                System.out.println("error al insertar la pieza. ");
				e.printStackTrace();
		}



       finally
        {
        	try
        	{
        		// Cierra la sentencia
        		if (sent!= null) sent.close();
        		// Cierra la conexion
        		if (con != null) con.close();
        		
        	}catch (SQLException e)
        	{
        		System.err.println("Error al cerrar conexion");
        	}
        }

        }

	public static  void crearPiezas() {
    
    // PIEZAS  BLANCAS (Asumiendo casillas 1 a 16)
    
    
    Pieza torreBlancaIzq = new Torre(Movimiento.directa, Comportamiento.armada, Color.blanco, Estado.libre, "Torre Blanca", new Casillero(1));
    insertarPieza(torreBlancaIzq);

    Pieza caballoBlancoIzq = new Caballo(Movimiento.sesgo_en_L, Comportamiento.ligero, Color.blanco, Estado.libre, "Caballo Blanco", new Casillero(2));
    insertarPieza(caballoBlancoIzq);

    Pieza alfilBlancoIzq = new Alfil(Movimiento.sesgo_en_diagonal, Comportamiento.oblicuo, Color.blanco, Estado.libre, "Alfil Blanco", new Casillero(3));
    insertarPieza(alfilBlancoIzq);


    Pieza reinaBlanca = new Reina(Movimiento.encarnizo, Comportamiento.homérica, Color.blanco, Estado.libre, "Reina Blanca", new Casillero(4));
    insertarPieza(reinaBlanca);

    Pieza reyBlanco = new Rey(Movimiento.tenue, Comportamiento.postrero, Color.blanco, Estado.libre, "Rey Blanco", new Casillero(5));
    insertarPieza(reyBlanco);


    Pieza alfilBlancoDer = new Alfil(Movimiento.sesgo_en_diagonal, Comportamiento.oblicuo, Color.blanco, Estado.libre, "Alfil Blanco", new Casillero(6));
    insertarPieza(alfilBlancoDer);

    Pieza caballoBlancoDer = new Caballo(Movimiento.sesgo_en_L, Comportamiento.ligero, Color.blanco, Estado.libre, "Caballo Blanco", new Casillero(7));
    insertarPieza(caballoBlancoDer);

    Pieza torreBlancaDer = new Torre(Movimiento.directa, Comportamiento.armada, Color.blanco, Estado.libre, "Torre Blanca", new Casillero(8));
    insertarPieza(torreBlancaDer);

    crearPeones(Color.blanco, 9);

    // PIEZAS  NEGRAS ( casillas 48 a 64)

    
    Pieza torreNegraIzq = new Torre(Movimiento.directa, Comportamiento.armada, Color.negro, Estado.libre, "Torre Negra", new Casillero(57));
    insertarPieza(torreNegraIzq);

    Pieza caballoNegroIzq = new Caballo(Movimiento.sesgo_en_L, Comportamiento.ligero, Color.negro, Estado.libre, "Caballo Negro", new Casillero(58));
    insertarPieza(caballoNegroIzq);

    Pieza alfilNegroIzq = new Alfil(Movimiento.sesgo_en_diagonal, Comportamiento.oblicuo, Color.negro, Estado.libre, "Alfil Negro", new Casillero(59));
    insertarPieza(alfilNegroIzq);

    Pieza reinaNegra = new Reina(Movimiento.encarnizo, Comportamiento.homérica, Color.negro, Estado.libre, "Reina Negra", new Casillero(60));
    insertarPieza(reinaNegra);

    Pieza reyNegro = new Rey(Movimiento.tenue, Comportamiento.postrero, Color.negro, Estado.libre, "Rey Negro", new Casillero(61));
    insertarPieza(reyNegro);

    Pieza alfilNegroDer = new Alfil(Movimiento.sesgo_en_diagonal, Comportamiento.oblicuo, Color.negro, Estado.libre, "Alfil Negro", new Casillero(62));
    insertarPieza(alfilNegroDer);

    Pieza caballoNegroDer = new Caballo(Movimiento.sesgo_en_L, Comportamiento.ligero, Color.negro, Estado.libre, "Caballo Negro", new Casillero(63));
    insertarPieza(caballoNegroDer);

    Pieza torreNegraDer = new Torre(Movimiento.directa, Comportamiento.armada, Color.negro, Estado.libre, "Torre Negra", new Casillero(64));
    insertarPieza(torreNegraDer);

    crearPeones(Color.negro, 49);
    
}
//dato válido del enum Color
private static void crearPeones(Color colorElegido, int limite) {
    int n = limite;
    String descriPeon = "peon " + colorElegido.name();

       for (int i = 1; i <= 8; i++) {
        Pieza peon = new Peon(Movimiento.directa,Comportamiento.ligero,colorElegido,Estado.libre,descriPeon,new Casillero(n));
        n = n + 1;
        insertarPieza(peon);
        }
}




public static void mostrarPiezasBD() {
    AccesoDatos accesoBD = null;
    Connection con = null;
    Statement sentencia = null;
    ResultSet rs = null;
    
    String query = "SELECT * FROM pieza"; 
    
    try {
        // Instancio el objeto y conecto UNA sola vez
        accesoBD = new AccesoDatos();
        accesoBD.conectar();
        con = accesoBD.getConexion();
        
        sentencia = con.createStatement();
        rs = sentencia.executeQuery(query);
        

        System.out.println("--------------------------------------------------------------------------------------------------------");
        System.out.printf(" | %-17s | %-12s | %-12s | %-14s | %-17s | %-12s | %n", 
                          "DESCRIPCIoN", "IDCASILLERO", "IDCOLOR","COMPORTAMIENTO", "MOVIMIENTO","IDTIPOPIEZA");
        System.out.println("--------------------------------------------------------------------------------------------------------");
        
        while (rs.next()) {
            // Extraigo los datos
            String descripcion = rs.getString("Descripcion");
            String idCasillero = rs.getString("idCasillero");
            String color = rs.getString("idColor");
            String movimiento = rs.getString("Movimiento");
            String comportamiento = rs.getString("comportamiento");
            String idtipoPieza= rs.getString("idTipoPieza");
            System.out.printf(" | %-17s | %-12s | %-12s |%-15s | %-17s | %12s |%n", 
                              descripcion, idCasillero, color,comportamiento, movimiento,idtipoPieza);
        }
        
        System.out.println("--------------------------------------------------------------------------------------------------------");
        
    } catch (Exception e) {
        System.out.println("Error al ejecutar la consulta: " + e.getMessage());
    } finally {
        // Bloque finally para asegurar que los recursos se cierren siempre
        try {
            if (rs != null) rs.close();
            if (sentencia != null) sentencia.close();
            if (con != null) con.close();
        } catch (Exception ex) {
            System.out.println("Error al cerrar la conexión: " + ex.getMessage());
        }
    }
}

}