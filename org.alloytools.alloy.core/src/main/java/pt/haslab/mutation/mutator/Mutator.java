package pt.haslab.mutation.mutator;

import edu.mit.csail.sdg.alloy4.ConstList;
import edu.mit.csail.sdg.alloy4.Pos;
import edu.mit.csail.sdg.ast.Expr;
import edu.mit.csail.sdg.ast.Sig;
import org.eclipse.jdt.annotation.NonNull;

import java.util.*;

public class Mutator {
    public Expr original;
    public Expr mutant;
    public Set<Expr> blacklisted = new HashSet<>();

    public String name = "Mutator";

    public static List<Mutator> generate(Expr ignoredExpr){
        return new ArrayList<>();
    }

    public static List<Mutator> generate(Expr ignoredExpr, ConstList<Sig> ignoredSigs){
        return generate(ignoredExpr);
    }

    public static Mutator make(@NonNull Expr original, @NonNull Expr mutant){
        Mutator ret = new Mutator();
        ret.original = original;
        ret.mutant = mutant;
        return ret;
    }

    @Override
    public String toString() {
        Pos pos = original.pos();
        return this.getClass().getSimpleName() + "{" +
                "'" + name + "', " +
                "pos='(" + pos.x + "," + pos.y + ")-(" + pos.x2 + "," + pos.y2 + ")'," +
                "}";
    }

    public String toJSON(){
        return "{" +
                "\"mutator\": \"" + this + "\"," +
                "\"pos\": \"" + this.mutant.pos + "\"" +
                "}";
    }

    public String describe(){
        return this.getClass().getSimpleName() + "\n"
                + this.original.pos + "\n"
                + "<|" + this.original + "\n"
                + "|>" + this.mutant;
    }
}
