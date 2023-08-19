defmodule PautasJuego do
  def jugar(opcion_jugador, opcion_cpu) do
    if opcion_jugador == opcion_cpu do
      "Empate"
    else
      case {opcion_jugador, opcion_cpu} do
        {"piedra", "tijera"} -> "¡Ganaste!"
        {"papel", "piedra"} -> "¡Ganaste!"
        {"tijera", "papel"} -> "¡Ganaste!"
        _ -> "¡Perdiste!"
      end
    end
  end
end

defmodule Juego do
  def play do
    opciones_validas = ["piedra", "papel", "tijera"]

    IO.puts("Elige piedra, papel o tijera: ")
    opcion_jugador = String.downcase(String.trim(IO.gets("")))

    if opcion_jugador in opciones_validas do
      opcion_cpu = Enum.random(opciones_validas)
      resultado = PautasJuego.jugar(opcion_jugador, opcion_cpu)

      IO.puts("Jugador eligió #{opcion_jugador}")
      IO.puts("CPU eligió #{opcion_cpu}")
      IO.puts(resultado)

      if resultado == "Empate" do
        IO.puts("Empate, ¡vuelve a intentarlo!")
        play()  
      end
    else
      IO.puts("Opción inválida. Elige piedra, papel o tijera.")
      play()  
    end
  end
end

Juego.play()
