import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public aspect ClientAspectJ{

    private static final Logger logger = LogManager.getLogger(ClientAspectJ.class);

    pointcut operation(Client client):(call(* *.. Client.retirer(*))
            || call(* *..Client.verser(*)));

    void around(Client client): operation(client){
        logger.info(new StringBuilder().append("Le client").append(client.getNom()).append("a effectue loperation")
                .append(thisJoinPoint.getSignature().getName()).append(" d'un montant de")
                .append(thisJoinPoint.getArgs()[0].toString()).toString());
        logger.info("Solde avant " + client.getCp().getSolde() + " ");
        double start = System.nanoTime();
        proceed(client);
        logger.info("Solde apres"+client.getCp().getSolde()+" ");
        logger.info("Le temps d'execution de l'operation est: "+(((System.nanoTime()) - start)/1000000));
    }
}
