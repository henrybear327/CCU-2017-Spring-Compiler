// Generated from Cactus.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CactusParser}.
 */
public interface CactusListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CactusParser#s}.
	 * @param ctx the parse tree
	 */
	void enterS(CactusParser.SContext ctx);
	/**
	 * Exit a parse tree produced by {@link CactusParser#s}.
	 * @param ctx the parse tree
	 */
	void exitS(CactusParser.SContext ctx);
	/**
	 * Enter a parse tree produced by {@link CactusParser#r}.
	 * @param ctx the parse tree
	 */
	void enterR(CactusParser.RContext ctx);
	/**
	 * Exit a parse tree produced by {@link CactusParser#r}.
	 * @param ctx the parse tree
	 */
	void exitR(CactusParser.RContext ctx);
	/**
	 * Enter a parse tree produced by {@link CactusParser#l}.
	 * @param ctx the parse tree
	 */
	void enterL(CactusParser.LContext ctx);
	/**
	 * Exit a parse tree produced by {@link CactusParser#l}.
	 * @param ctx the parse tree
	 */
	void exitL(CactusParser.LContext ctx);
	/**
	 * Enter a parse tree produced by {@link CactusParser#ls}.
	 * @param ctx the parse tree
	 */
	void enterLs(CactusParser.LsContext ctx);
	/**
	 * Exit a parse tree produced by {@link CactusParser#ls}.
	 * @param ctx the parse tree
	 */
	void exitLs(CactusParser.LsContext ctx);
	/**
	 * Enter a parse tree produced by {@link CactusParser#b}.
	 * @param ctx the parse tree
	 */
	void enterB(CactusParser.BContext ctx);
	/**
	 * Exit a parse tree produced by {@link CactusParser#b}.
	 * @param ctx the parse tree
	 */
	void exitB(CactusParser.BContext ctx);
	/**
	 * Enter a parse tree produced by {@link CactusParser#token}.
	 * @param ctx the parse tree
	 */
	void enterToken(CactusParser.TokenContext ctx);
	/**
	 * Exit a parse tree produced by {@link CactusParser#token}.
	 * @param ctx the parse tree
	 */
	void exitToken(CactusParser.TokenContext ctx);
}