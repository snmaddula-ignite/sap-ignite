package startup;

import org.apache.ignite.Ignition;

/** This file was generated by Ignite Web Console (01/31/2019, 12:31) **/
public class ClientNodeSpringStartup {
    /**
     * Start up node with specified configuration.
     * 
     * @param args Command line arguments, none required.
     * @throws Exception If failed.
     **/
    public static void main(String[] args) throws Exception {
        Ignition.start("sap-ignite-client.xml");
    }
}