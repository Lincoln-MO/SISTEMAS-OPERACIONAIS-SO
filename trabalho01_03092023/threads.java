/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package so;

/**
 *
 * @author Lincoln
 */

public class SO {
    // Variável global compartilhada
    private static int contador = 0;
    // Objeto de bloqueio para sincronização
    private static final Object lock = new Object();

    public static void main(String[] args) {
        // Criação das threads
        Thread thread1 = new Thread(() -> incrementarContador(1, 2, 10));
        Thread thread2 = new Thread(() -> incrementarContador(2, 5, 10));

        // Inicia as threads
        thread1.start();
        thread2.start();

        try {
            // Aguarda o término das threads
            thread1.join();
            thread2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Valor final do contador: " + contador);
    }

    // Função para incrementar o contador
    private static void incrementarContador(int threadNum, int incremento, int repeticoes) {
        for (int i = 0; i < repeticoes; i++) {
            synchronized (lock) { // Adquire o bloqueio
                contador += incremento;
            }
            System.out.println("Thread " + threadNum + ": Contador = " + contador);
        }
    }
}
