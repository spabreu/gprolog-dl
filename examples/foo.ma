

pl_code global X666F6F_1__X666F6F_0
	call_c     fast Put_List()
	move_ret   X(1)
	call_c     fast Unify_Value(X(255))
	fail_ret   
	call_c     fast Unify_Nil()
	fail_ret   
	call_c     fast Put_List()
	move_ret   X(0)
	call_c     fast Unify_Integer_Tagged(-2147483237)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483201)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483201)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483457)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483449)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483413)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483237)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483201)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483201)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483457)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483453)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483413)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483517)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483249)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483201)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483205)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483181)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483241)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483165)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483181)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483517)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483225)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483185)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483517)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483141)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483169)
	fail_ret   
	call_c     fast Unify_List()
	fail_ret   
	call_c     fast Unify_Integer_Tagged(-2147483605)
	fail_ret   
	call_c     fast Unify_Nil()
	fail_ret   
	pl_jump    X666F726D6174_2


pl_code global X666F6F_1__X67726F6B_1
	call_c     fast Cxt_Arg_Load(0,X(255),&X(1))
	fail_ret   
	call_c     fast Cxt_Arg_Load(0,X(1),&X(1))
	fail_ret   
	pl_jump    X6D656D626572_2


pl_code local directive_1
	call_c     fast Put_Structure_Tagged(fn(0))
	move_ret   X(0)
	call_c     fast Unify_Atom_Tagged(ta(0))
	fail_ret   
	pl_jump    X7772697465_1


long local at(3)
long local ta(1)
long local fn(1)


c_code  global Object_Initializer

	call_c     New_Object(&System_Directives,&User_Directives)
	call_c     fast Create_Atom("/home/spa/work/maint/gprolog-dl/examples/foo.pl")
	move_ret   at(1)
	call_c     fast Create_Atom("foo")
	move_ret   at(0)
	call_c     fast Create_Atom("grok")
	move_ret   at(2)
	call_c     fast Create_Atom_Tagged("foo")
	move_ret   ta(0)
	call_c     fast Create_Functor_Arity_Tagged("init",1)
	move_ret   fn(0)

	call_c     fast Create_Pred_Module(at(0),1,at(0),0,at(1),5,1,&X666F6F_1__X666F6F_0)

	call_c     fast Create_Pred_Module(at(0),1,at(2),1,at(1),7,1,&X666F6F_1__X67726F6B_1)
	c_ret      

c_code  local System_Directives

	c_ret      

c_code  local User_Directives

	call_c     Execute_Directive(at(1),1,0,&directive_1)
	c_ret      
