public class Pinguin {
    public final String publicName;
    private final String privateName;
    
    public Pinguin(String name) {
        this.publicName = name.replace("_", " ");
        this.privateName = name;
    }

    public String cuteSound() { 
        return "Kwiiik :)";
    }

    public String cuteMove() {
        return "Sliding yay!";
    }

    private int cutenessLevel() {
        return 7; // because why not
    }
}