// Generated from Cactus.g4 by ANTLR 4.7
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class CactusParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		ELSE=1, FI=2, IF=3, INT=4, MAIN=5, RETURN=6, WHILE=7, READ=8, WRITE=9, 
		CONST=10, SEMICOLON=11, ID=12, WHITESPACE=13, COMMENT=14, ADD=15, MINUS=16, 
		STAR=17, FORWARDSLASH=18, PERCENTAGE=19, ISEQUAL=20, NOTEQUAL=21, GREATER=22, 
		GREATEREQUAL=23, LESS=24, LESSEQUAL=25, LOGICALAND=26, LOGICALOR=27, NOT=28, 
		EQUAL=29, LEFTPARENTHESIS=30, RIGHTPARENTHESIS=31, LEFTBRACE=32, RIGHTBRACE=33;
	public static final int
		RULE_token = 0;
	public static final String[] ruleNames = {
		"token"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'else'", "'fi'", "'if'", "'int'", "'main'", "'return'", "'while'", 
		"'read'", "'write'", null, "';'", null, null, null, "'+'", "'-'", "'*'", 
		"'/'", "'%'", null, "'!='", "'>'", "'>='", "'<'", "'<='", "'&&'", "'||'", 
		"'!'", null, "'{'", "'}'", "'('", "')'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "ELSE", "FI", "IF", "INT", "MAIN", "RETURN", "WHILE", "READ", "WRITE", 
		"CONST", "SEMICOLON", "ID", "WHITESPACE", "COMMENT", "ADD", "MINUS", "STAR", 
		"FORWARDSLASH", "PERCENTAGE", "ISEQUAL", "NOTEQUAL", "GREATER", "GREATEREQUAL", 
		"LESS", "LESSEQUAL", "LOGICALAND", "LOGICALOR", "NOT", "EQUAL", "LEFTPARENTHESIS", 
		"RIGHTPARENTHESIS", "LEFTBRACE", "RIGHTBRACE"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "Cactus.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public CactusParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class TokenContext extends ParserRuleContext {
		public List<TerminalNode> ELSE() { return getTokens(CactusParser.ELSE); }
		public TerminalNode ELSE(int i) {
			return getToken(CactusParser.ELSE, i);
		}
		public List<TerminalNode> FI() { return getTokens(CactusParser.FI); }
		public TerminalNode FI(int i) {
			return getToken(CactusParser.FI, i);
		}
		public List<TerminalNode> IF() { return getTokens(CactusParser.IF); }
		public TerminalNode IF(int i) {
			return getToken(CactusParser.IF, i);
		}
		public List<TerminalNode> INT() { return getTokens(CactusParser.INT); }
		public TerminalNode INT(int i) {
			return getToken(CactusParser.INT, i);
		}
		public List<TerminalNode> MAIN() { return getTokens(CactusParser.MAIN); }
		public TerminalNode MAIN(int i) {
			return getToken(CactusParser.MAIN, i);
		}
		public List<TerminalNode> RETURN() { return getTokens(CactusParser.RETURN); }
		public TerminalNode RETURN(int i) {
			return getToken(CactusParser.RETURN, i);
		}
		public List<TerminalNode> WHILE() { return getTokens(CactusParser.WHILE); }
		public TerminalNode WHILE(int i) {
			return getToken(CactusParser.WHILE, i);
		}
		public List<TerminalNode> READ() { return getTokens(CactusParser.READ); }
		public TerminalNode READ(int i) {
			return getToken(CactusParser.READ, i);
		}
		public List<TerminalNode> WRITE() { return getTokens(CactusParser.WRITE); }
		public TerminalNode WRITE(int i) {
			return getToken(CactusParser.WRITE, i);
		}
		public List<TerminalNode> CONST() { return getTokens(CactusParser.CONST); }
		public TerminalNode CONST(int i) {
			return getToken(CactusParser.CONST, i);
		}
		public List<TerminalNode> COMMENT() { return getTokens(CactusParser.COMMENT); }
		public TerminalNode COMMENT(int i) {
			return getToken(CactusParser.COMMENT, i);
		}
		public List<TerminalNode> WHITESPACE() { return getTokens(CactusParser.WHITESPACE); }
		public TerminalNode WHITESPACE(int i) {
			return getToken(CactusParser.WHITESPACE, i);
		}
		public List<TerminalNode> SEMICOLON() { return getTokens(CactusParser.SEMICOLON); }
		public TerminalNode SEMICOLON(int i) {
			return getToken(CactusParser.SEMICOLON, i);
		}
		public List<TerminalNode> ID() { return getTokens(CactusParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(CactusParser.ID, i);
		}
		public List<TerminalNode> ADD() { return getTokens(CactusParser.ADD); }
		public TerminalNode ADD(int i) {
			return getToken(CactusParser.ADD, i);
		}
		public List<TerminalNode> MINUS() { return getTokens(CactusParser.MINUS); }
		public TerminalNode MINUS(int i) {
			return getToken(CactusParser.MINUS, i);
		}
		public List<TerminalNode> STAR() { return getTokens(CactusParser.STAR); }
		public TerminalNode STAR(int i) {
			return getToken(CactusParser.STAR, i);
		}
		public List<TerminalNode> FORWARDSLASH() { return getTokens(CactusParser.FORWARDSLASH); }
		public TerminalNode FORWARDSLASH(int i) {
			return getToken(CactusParser.FORWARDSLASH, i);
		}
		public List<TerminalNode> PERCENTAGE() { return getTokens(CactusParser.PERCENTAGE); }
		public TerminalNode PERCENTAGE(int i) {
			return getToken(CactusParser.PERCENTAGE, i);
		}
		public List<TerminalNode> ISEQUAL() { return getTokens(CactusParser.ISEQUAL); }
		public TerminalNode ISEQUAL(int i) {
			return getToken(CactusParser.ISEQUAL, i);
		}
		public List<TerminalNode> NOTEQUAL() { return getTokens(CactusParser.NOTEQUAL); }
		public TerminalNode NOTEQUAL(int i) {
			return getToken(CactusParser.NOTEQUAL, i);
		}
		public List<TerminalNode> GREATER() { return getTokens(CactusParser.GREATER); }
		public TerminalNode GREATER(int i) {
			return getToken(CactusParser.GREATER, i);
		}
		public List<TerminalNode> GREATEREQUAL() { return getTokens(CactusParser.GREATEREQUAL); }
		public TerminalNode GREATEREQUAL(int i) {
			return getToken(CactusParser.GREATEREQUAL, i);
		}
		public List<TerminalNode> LESS() { return getTokens(CactusParser.LESS); }
		public TerminalNode LESS(int i) {
			return getToken(CactusParser.LESS, i);
		}
		public List<TerminalNode> LESSEQUAL() { return getTokens(CactusParser.LESSEQUAL); }
		public TerminalNode LESSEQUAL(int i) {
			return getToken(CactusParser.LESSEQUAL, i);
		}
		public List<TerminalNode> LOGICALAND() { return getTokens(CactusParser.LOGICALAND); }
		public TerminalNode LOGICALAND(int i) {
			return getToken(CactusParser.LOGICALAND, i);
		}
		public List<TerminalNode> LOGICALOR() { return getTokens(CactusParser.LOGICALOR); }
		public TerminalNode LOGICALOR(int i) {
			return getToken(CactusParser.LOGICALOR, i);
		}
		public List<TerminalNode> NOT() { return getTokens(CactusParser.NOT); }
		public TerminalNode NOT(int i) {
			return getToken(CactusParser.NOT, i);
		}
		public List<TerminalNode> EQUAL() { return getTokens(CactusParser.EQUAL); }
		public TerminalNode EQUAL(int i) {
			return getToken(CactusParser.EQUAL, i);
		}
		public List<TerminalNode> LEFTPARENTHESIS() { return getTokens(CactusParser.LEFTPARENTHESIS); }
		public TerminalNode LEFTPARENTHESIS(int i) {
			return getToken(CactusParser.LEFTPARENTHESIS, i);
		}
		public List<TerminalNode> RIGHTPARENTHESIS() { return getTokens(CactusParser.RIGHTPARENTHESIS); }
		public TerminalNode RIGHTPARENTHESIS(int i) {
			return getToken(CactusParser.RIGHTPARENTHESIS, i);
		}
		public List<TerminalNode> LEFTBRACE() { return getTokens(CactusParser.LEFTBRACE); }
		public TerminalNode LEFTBRACE(int i) {
			return getToken(CactusParser.LEFTBRACE, i);
		}
		public List<TerminalNode> RIGHTBRACE() { return getTokens(CactusParser.RIGHTBRACE); }
		public TerminalNode RIGHTBRACE(int i) {
			return getToken(CactusParser.RIGHTBRACE, i);
		}
		public TokenContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_token; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof CactusListener ) ((CactusListener)listener).enterToken(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof CactusListener ) ((CactusListener)listener).exitToken(this);
		}
	}

	public final TokenContext token() throws RecognitionException {
		TokenContext _localctx = new TokenContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_token);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(5);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ELSE) | (1L << FI) | (1L << IF) | (1L << INT) | (1L << MAIN) | (1L << RETURN) | (1L << WHILE) | (1L << READ) | (1L << WRITE) | (1L << CONST) | (1L << SEMICOLON) | (1L << ID) | (1L << WHITESPACE) | (1L << COMMENT) | (1L << ADD) | (1L << MINUS) | (1L << STAR) | (1L << FORWARDSLASH) | (1L << PERCENTAGE) | (1L << ISEQUAL) | (1L << NOTEQUAL) | (1L << GREATER) | (1L << GREATEREQUAL) | (1L << LESS) | (1L << LESSEQUAL) | (1L << LOGICALAND) | (1L << LOGICALOR) | (1L << NOT) | (1L << EQUAL) | (1L << LEFTPARENTHESIS) | (1L << RIGHTPARENTHESIS) | (1L << LEFTBRACE) | (1L << RIGHTBRACE))) != 0)) {
				{
				{
				setState(2);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ELSE) | (1L << FI) | (1L << IF) | (1L << INT) | (1L << MAIN) | (1L << RETURN) | (1L << WHILE) | (1L << READ) | (1L << WRITE) | (1L << CONST) | (1L << SEMICOLON) | (1L << ID) | (1L << WHITESPACE) | (1L << COMMENT) | (1L << ADD) | (1L << MINUS) | (1L << STAR) | (1L << FORWARDSLASH) | (1L << PERCENTAGE) | (1L << ISEQUAL) | (1L << NOTEQUAL) | (1L << GREATER) | (1L << GREATEREQUAL) | (1L << LESS) | (1L << LESSEQUAL) | (1L << LOGICALAND) | (1L << LOGICALOR) | (1L << NOT) | (1L << EQUAL) | (1L << LEFTPARENTHESIS) | (1L << RIGHTPARENTHESIS) | (1L << LEFTBRACE) | (1L << RIGHTBRACE))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				}
				setState(7);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3#\13\4\2\t\2\3\2\7"+
		"\2\6\n\2\f\2\16\2\t\13\2\3\2\2\2\3\2\2\3\3\2\3#\2\n\2\7\3\2\2\2\4\6\t"+
		"\2\2\2\5\4\3\2\2\2\6\t\3\2\2\2\7\5\3\2\2\2\7\b\3\2\2\2\b\3\3\2\2\2\t\7"+
		"\3\2\2\2\3\7";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}