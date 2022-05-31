package pt.haslab.mutation.mutator.relation;

import edu.mit.csail.sdg.alloy4.ConstList;
import edu.mit.csail.sdg.ast.*;
import pt.haslab.mutation.Location;
import pt.haslab.mutation.mutator.Mutator;
import pt.haslab.util.ExprMaker;

import java.util.List;

public class InsertJoinMutator extends Mutator {

    private InsertJoinMutator(Location original, Expr expr) {
        this.original = original;
        this.mutant = expr;
        this.name = original.expr + "->" + expr;
    }

    private static void joinIfCompatible(List<Mutator> accumulator, Location original, Expr expr) {
        Type orig_type = original.expr.type();
        Type left_join = expr.type().join(orig_type);
        if (!left_join.equals(Sig.NONE.type()) && (!original.insideDecl || orig_type.arity() == left_join.arity())) {
            accumulator.add(new InsertJoinMutator(original, ExprMaker.make(expr, original.expr, ExprBinary.Op.JOIN)));
        }

        Type right_join = original.expr.type().join(expr.type());
        if (!right_join.equals(Sig.NONE.type()) && (!original.insideDecl || orig_type.arity() == right_join.arity())) {
            accumulator.add(new InsertJoinMutator(original, ExprMaker.make(original.expr, expr, ExprBinary.Op.JOIN)));
        }
    }

    public static void generate(List<Mutator> accumulator, Location original, ConstList<Sig> sigs, ConstList<Sig.Field> fields) {

        switch (original.expr.type().arity()) {
            case 1:
                for (Sig.Field field : fields) {
                    joinIfCompatible(accumulator, original, field);
                }
                break;
            default:
                for (Sig sig : sigs) {
                    joinIfCompatible(accumulator, original, sig);
                }
                for (ExprHasName var : original.vars) {
                    if (var instanceof ExprVar) {
                        joinIfCompatible(accumulator, original, var);
                    }
                }
                break;
        }
    }
}