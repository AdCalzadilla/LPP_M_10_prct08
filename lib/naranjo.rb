class Naranjo
    attr_reader :age, :hight, :numNaranjas
    
    def initialize()
        @age = 0
        @hight = 0
        @numNaranjas = 0
    end
    
    def uno_mas
        if (@age >= 30)
            naranjoMuerto
        else
            @age += 1
            @hight += 0.5
            production
        end
    end
    
    def recolectar_una
        cadena =""
        if (isDead?)
            cadena = "El arbol esta muerto"
        elsif (@numNaranjas >= 1)
            @numNaranjas -= 1
            cadena = "Se ha recolectado una fruta"
        else
            cadena = "No hay fruta"
        end
        cadena
    end
    
    def production
        if (@age > 5)
            @numNaranjas += 1+rand(@age)
        end
    end
        
    def naranjoMuerto
        @hight = 0
    end
    
    def isDead?
        if (@age >= 30 && @hight == 0)
            return true
        end
        return false
    end

end