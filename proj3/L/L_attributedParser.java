// Generated from L_attributed.g4 by ANTLR 4.7
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class L_attributedParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		ZERO=1, ONE=2, DOT=3, WHITESPACE=4;
	public static final int
		RULE_s = 0, RULE_r = 1, RULE_l = 2, RULE_ls = 3, RULE_b = 4, RULE_token = 5;
	public static final String[] ruleNames = {
		"s", "r", "l", "ls", "b", "token"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'0'", "'1'", "'.'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "ZERO", "ONE", "DOT", "WHITESPACE"
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
	public String getGrammarFileName() { return "L_attributed.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public L_attributedParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class SContext extends ParserRuleContext {
		public LContext ret_l;
		public RContext ret_r;
		public LContext l() {
			return getRuleContext(LContext.class,0);
		}
		public RContext r() {
			return getRuleContext(RContext.class,0);
		}
		public SContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_s; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).enterS(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).exitS(this);
		}
	}

	public final SContext s() throws RecognitionException {
		SContext _localctx = new SContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_s);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(12);
			((SContext)_localctx).ret_l = l(1);
			setState(13);
			((SContext)_localctx).ret_r = r(0);
			System.out.println(((SContext)_localctx).ret_l.val + ((SContext)_localctx).ret_r.val);
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

	public static class RContext extends ParserRuleContext {
		public int side;
		public double val;
		public LContext ret_l;
		public TerminalNode DOT() { return getToken(L_attributedParser.DOT, 0); }
		public LContext l() {
			return getRuleContext(LContext.class,0);
		}
		public RContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public RContext(ParserRuleContext parent, int invokingState, int side) {
			super(parent, invokingState);
			this.side = side;
		}
		@Override public int getRuleIndex() { return RULE_r; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).enterR(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).exitR(this);
		}
	}

	public final RContext r(int side) throws RecognitionException {
		RContext _localctx = new RContext(_ctx, getState(), side);
		enterRule(_localctx, 2, RULE_r);
		try {
			setState(21);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case DOT:
				enterOuterAlt(_localctx, 1);
				{
				setState(16);
				match(DOT);
				setState(17);
				((RContext)_localctx).ret_l = l(_localctx.side);
				((RContext)_localctx).val =  ((RContext)_localctx).ret_l.val;
				}
				break;
			case EOF:
				enterOuterAlt(_localctx, 2);
				{
				((RContext)_localctx).val =  0;
				}
				break;
			default:
				throw new NoViableAltException(this);
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

	public static class LContext extends ParserRuleContext {
		public int side;
		public double base;
		public double val;
		public BContext ret_b;
		public LsContext ret_ls1;
		public BContext b() {
			return getRuleContext(BContext.class,0);
		}
		public LsContext ls() {
			return getRuleContext(LsContext.class,0);
		}
		public LContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public LContext(ParserRuleContext parent, int invokingState, int side) {
			super(parent, invokingState);
			this.side = side;
		}
		@Override public int getRuleIndex() { return RULE_l; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).enterL(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).exitL(this);
		}
	}

	public final LContext l(int side) throws RecognitionException {
		LContext _localctx = new LContext(_ctx, getState(), side);
		enterRule(_localctx, 4, RULE_l);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(23);
			((LContext)_localctx).ret_b = b();
			setState(24);
			((LContext)_localctx).ret_ls1 = ls(((LContext)_localctx).ret_b.val, _localctx.side);
			((LContext)_localctx).base =  ((LContext)_localctx).ret_ls1.base * 2;
														   ((LContext)_localctx).val =  _localctx.side == 1 ?
														   		((LContext)_localctx).ret_b.val * _localctx.base / 2 + ((LContext)_localctx).ret_ls1.val :
														   		((LContext)_localctx).ret_b.val / 2 + ((LContext)_localctx).ret_ls1.val / 2;
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

	public static class LsContext extends ParserRuleContext {
		public double orig_val;
		public int side;
		public double base;
		public double val;
		public BContext ret_b;
		public LsContext ret_ls1;
		public BContext b() {
			return getRuleContext(BContext.class,0);
		}
		public LsContext ls() {
			return getRuleContext(LsContext.class,0);
		}
		public LsContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public LsContext(ParserRuleContext parent, int invokingState, double orig_val, int side) {
			super(parent, invokingState);
			this.orig_val = orig_val;
			this.side = side;
		}
		@Override public int getRuleIndex() { return RULE_ls; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).enterLs(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).exitLs(this);
		}
	}

	public final LsContext ls(double orig_val,int side) throws RecognitionException {
		LsContext _localctx = new LsContext(_ctx, getState(), orig_val, side);
		enterRule(_localctx, 6, RULE_ls);
		try {
			setState(32);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ZERO:
			case ONE:
				enterOuterAlt(_localctx, 1);
				{
				setState(27);
				((LsContext)_localctx).ret_b = b();
				setState(28);
				((LsContext)_localctx).ret_ls1 = ls(((LsContext)_localctx).ret_b.val, _localctx.side);
				((LsContext)_localctx).base =  ((LsContext)_localctx).ret_ls1.base * 2;
															   ((LsContext)_localctx).val =  _localctx.side == 1 ?
															   		((LsContext)_localctx).ret_b.val * _localctx.base / 2 + ((LsContext)_localctx).ret_ls1.val :
															   		((LsContext)_localctx).ret_b.val / 2 + ((LsContext)_localctx).ret_ls1.val / 2;
				}
				break;
			case EOF:
			case DOT:
				enterOuterAlt(_localctx, 2);
				{
				((LsContext)_localctx).base =  1; ((LsContext)_localctx).val =  0;
				}
				break;
			default:
				throw new NoViableAltException(this);
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

	public static class BContext extends ParserRuleContext {
		public double val;
		public TerminalNode ZERO() { return getToken(L_attributedParser.ZERO, 0); }
		public TerminalNode ONE() { return getToken(L_attributedParser.ONE, 0); }
		public BContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_b; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).enterB(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).exitB(this);
		}
	}

	public final BContext b() throws RecognitionException {
		BContext _localctx = new BContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_b);
		try {
			setState(38);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ZERO:
				enterOuterAlt(_localctx, 1);
				{
				setState(34);
				match(ZERO);
				((BContext)_localctx).val =  0.0;
				}
				break;
			case ONE:
				enterOuterAlt(_localctx, 2);
				{
				setState(36);
				match(ONE);
				((BContext)_localctx).val =  1.0;
				}
				break;
			default:
				throw new NoViableAltException(this);
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

	public static class TokenContext extends ParserRuleContext {
		public List<TerminalNode> ZERO() { return getTokens(L_attributedParser.ZERO); }
		public TerminalNode ZERO(int i) {
			return getToken(L_attributedParser.ZERO, i);
		}
		public List<TerminalNode> ONE() { return getTokens(L_attributedParser.ONE); }
		public TerminalNode ONE(int i) {
			return getToken(L_attributedParser.ONE, i);
		}
		public List<TerminalNode> DOT() { return getTokens(L_attributedParser.DOT); }
		public TerminalNode DOT(int i) {
			return getToken(L_attributedParser.DOT, i);
		}
		public List<TerminalNode> WHITESPACE() { return getTokens(L_attributedParser.WHITESPACE); }
		public TerminalNode WHITESPACE(int i) {
			return getToken(L_attributedParser.WHITESPACE, i);
		}
		public TokenContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_token; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).enterToken(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof L_attributedListener ) ((L_attributedListener)listener).exitToken(this);
		}
	}

	public final TokenContext token() throws RecognitionException {
		TokenContext _localctx = new TokenContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_token);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(43);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ZERO) | (1L << ONE) | (1L << DOT) | (1L << WHITESPACE))) != 0)) {
				{
				{
				setState(40);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ZERO) | (1L << ONE) | (1L << DOT) | (1L << WHITESPACE))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				}
				setState(45);
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\6\61\4\2\t\2\4\3"+
		"\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3"+
		"\3\5\3\30\n\3\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\5\5#\n\5\3\6\3\6\3\6"+
		"\3\6\5\6)\n\6\3\7\7\7,\n\7\f\7\16\7/\13\7\3\7\2\2\b\2\4\6\b\n\f\2\3\3"+
		"\2\3\6\2.\2\16\3\2\2\2\4\27\3\2\2\2\6\31\3\2\2\2\b\"\3\2\2\2\n(\3\2\2"+
		"\2\f-\3\2\2\2\16\17\5\6\4\2\17\20\5\4\3\2\20\21\b\2\1\2\21\3\3\2\2\2\22"+
		"\23\7\5\2\2\23\24\5\6\4\2\24\25\b\3\1\2\25\30\3\2\2\2\26\30\b\3\1\2\27"+
		"\22\3\2\2\2\27\26\3\2\2\2\30\5\3\2\2\2\31\32\5\n\6\2\32\33\5\b\5\2\33"+
		"\34\b\4\1\2\34\7\3\2\2\2\35\36\5\n\6\2\36\37\5\b\5\2\37 \b\5\1\2 #\3\2"+
		"\2\2!#\b\5\1\2\"\35\3\2\2\2\"!\3\2\2\2#\t\3\2\2\2$%\7\3\2\2%)\b\6\1\2"+
		"&\'\7\4\2\2\')\b\6\1\2($\3\2\2\2(&\3\2\2\2)\13\3\2\2\2*,\t\2\2\2+*\3\2"+
		"\2\2,/\3\2\2\2-+\3\2\2\2-.\3\2\2\2.\r\3\2\2\2/-\3\2\2\2\6\27\"(-";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}