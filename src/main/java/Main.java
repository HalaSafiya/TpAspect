public class Main {
    public static void main(String[] args) {
        Client client = new Client();
        client.setNom("El Hijazi");
        Compte cpt = new Compte();
        client.setCp(cpt);
        client.verser(2500.0);
        client.retirer(500.0);

    }
}
