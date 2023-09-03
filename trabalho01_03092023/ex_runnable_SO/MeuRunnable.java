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
public class MeuRunnable implements Runnable {
    
    @Override
    public void run() {
        String name = Thread.currentThread().getName();
        System.out.println(name);
    }
    
}
