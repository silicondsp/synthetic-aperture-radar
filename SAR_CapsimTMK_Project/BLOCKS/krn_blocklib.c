

































































































































































































































































































































































































































































































/* krn_blocklib.c */
/****************************************************************************

		BLOCK LIBRARY FILE

*****************************************************************************
This file is used to define the block library.  It declares the       
global model table and initializes it for stars.  (Hierarchical Blocks (HBlocks)  are      
added later.)                                                        
                                                                     
Whenever the library containing the blocks is updated, this file MUST 
also be updated, and the executable re-made.  Don't forget to set    
'model_count', the total number of stars defined including NULL!     
                                                                    
*/                                                                   

#include <capsim.h>

/* Function declarations */



















































































































































































































































int add(int  run_state,block_Pt  block_P);
int addnoise(int  run_state,block_Pt  block_P);
int and(int  run_state,block_Pt  block_P);
int ang(int  run_state,block_Pt  block_P);
int arprocess(int  run_state,block_Pt  block_P);
int atod(int  run_state,block_Pt  block_P);
int autoxcorr(int  run_state,block_Pt  block_P);
int avrow(int  run_state,block_Pt  block_P);
int bdata(int  run_state,block_Pt  block_P);
int bitmanip(int  run_state,block_Pt  block_P);
int bitvec(int  run_state,block_Pt  block_P);
int blindadapt(int  run_state,block_Pt  block_P);
int bpf(int  run_state,block_Pt  block_P);
int cable(int  run_state,block_Pt  block_P);
int casfil(int  run_state,block_Pt  block_P);
int clip(int  run_state,block_Pt  block_P);
int clkdly(int  run_state,block_Pt  block_P);
int cmplxfft(int  run_state,block_Pt  block_P);
int cmux(int  run_state,block_Pt  block_P);
int cmxfft(int  run_state,block_Pt  block_P);
int cmxfftfile(int  run_state,block_Pt  block_P);
int cmxifft(int  run_state,block_Pt  block_P);
int convolve(int  run_state,block_Pt  block_P);
int cstime(int  run_state,block_Pt  block_P);
int cubepoly(int  run_state,block_Pt  block_P);
int cxadd(int  run_state,block_Pt  block_P);
int cxaddnoise(int  run_state,block_Pt  block_P);
int cxconj(int  run_state,block_Pt  block_P);
int cxcorr(int  run_state,block_Pt  block_P);
int cxdelay(int  run_state,block_Pt  block_P);
int cxgain(int  run_state,block_Pt  block_P);
int cxmag(int  run_state,block_Pt  block_P);
int cxmakecx(int  run_state,block_Pt  block_P);
int cxmakereal(int  run_state,block_Pt  block_P);
int cxmult(int  run_state,block_Pt  block_P);
int cxnode(int  run_state,block_Pt  block_P);
int cxphase(int  run_state,block_Pt  block_P);
int cxrdfile(int  run_state,block_Pt  block_P);
int cxreal(int  run_state,block_Pt  block_P);
int cxreim(int  run_state,block_Pt  block_P);
int cxsetsnr(int  run_state,block_Pt  block_P);
int cxsink(int  run_state,block_Pt  block_P);
int cxskip(int  run_state,block_Pt  block_P);
int cxsum(int  run_state,block_Pt  block_P);
int datagen(int  run_state,block_Pt  block_P);
int dco(int  run_state,block_Pt  block_P);
int dco2(int  run_state,block_Pt  block_P);
int dec_qpsk(int  run_state,block_Pt  block_P);
int decbin(int  run_state,block_Pt  block_P);
int decimate(int  run_state,block_Pt  block_P);
int delay(int  run_state,block_Pt  block_P);
int demux(int  run_state,block_Pt  block_P);
int dff(int  run_state,block_Pt  block_P);
int dffil(int  run_state,block_Pt  block_P);
int divby2(int  run_state,block_Pt  block_P);
int divider(int  run_state,block_Pt  block_P);
int divider2(int  run_state,block_Pt  block_P);
int ds2(int  run_state,block_Pt  block_P);
int ds3(int  run_state,block_Pt  block_P);
int dtoa(int  run_state,block_Pt  block_P);
int ecount(int  run_state,block_Pt  block_P);
int ecountfap(int  run_state,block_Pt  block_P);
int encoder(int  run_state,block_Pt  block_P);
int ethline(int  run_state,block_Pt  block_P);
int expr(int  run_state,block_Pt  block_P);
int fade(int  run_state,block_Pt  block_P);
int fconv(int  run_state,block_Pt  block_P);
int filtnyq(int  run_state,block_Pt  block_P);
int fir(int  run_state,block_Pt  block_P);
int firfil(int  run_state,block_Pt  block_P);
int fm(int  run_state,block_Pt  block_P);
int freq_meter(int  run_state,block_Pt  block_P);
int freqimp(int  run_state,block_Pt  block_P);
int fti(int  run_state,block_Pt  block_P);
int fxadd(int  run_state,block_Pt  block_P);
int fxdelay(int  run_state,block_Pt  block_P);
int fxgain(int  run_state,block_Pt  block_P);
int fxnl(int  run_state,block_Pt  block_P);
int fxnode(int  run_state,block_Pt  block_P);
int gain(int  run_state,block_Pt  block_P);
int gauss(int  run_state,block_Pt  block_P);
int hilbert(int  run_state,block_Pt  block_P);
int histtxt(int  run_state,block_Pt  block_P);
int hold(int  run_state,block_Pt  block_P);
int iirfil(int  run_state,block_Pt  block_P);
int img_sar_azimuth_compress(int  run_state,block_Pt  block_P);
int img_sar_create(int  run_state,block_Pt  block_P);
int img_sar_range_compress(int  run_state,block_Pt  block_P);
int imgaddnoise(int  run_state,block_Pt  block_P);
int imgbreakup(int  run_state,block_Pt  block_P);
int imgbuild(int  run_state,block_Pt  block_P);
int imgcalc(int  run_state,block_Pt  block_P);
int imgcxmag(int  run_state,block_Pt  block_P);
int imgcxtrl(int  run_state,block_Pt  block_P);
int imgfft(int  run_state,block_Pt  block_P);
int imgfilter(int  run_state,block_Pt  block_P);
int imggen(int  run_state,block_Pt  block_P);
int imghisteq(int  run_state,block_Pt  block_P);
int imginterp(int  run_state,block_Pt  block_P);
int imgmanip(int  run_state,block_Pt  block_P);
int imgmux(int  run_state,block_Pt  block_P);
int imgnode(int  run_state,block_Pt  block_P);
int imgnonlinfil(int  run_state,block_Pt  block_P);
int imgnormalize(int  run_state,block_Pt  block_P);
int imgprasc(int  run_state,block_Pt  block_P);
int imgprbin(int  run_state,block_Pt  block_P);
int imgproc(int  run_state,block_Pt  block_P);
int imgrdasc(int  run_state,block_Pt  block_P);
int imgrdbin(int  run_state,block_Pt  block_P);
int imgrdfptiff(int  run_state,block_Pt  block_P);
int imgrdtiff(int  run_state,block_Pt  block_P);
int imgrtcx(int  run_state,block_Pt  block_P);
int imgserin(int  run_state,block_Pt  block_P);
int imgserout(int  run_state,block_Pt  block_P);
int imgshrink(int  run_state,block_Pt  block_P);
int imgsink(int  run_state,block_Pt  block_P);
int imgsubimg(int  run_state,block_Pt  block_P);
int imgwrfptiff(int  run_state,block_Pt  block_P);
int imgwrtiff(int  run_state,block_Pt  block_P);
int impulse(int  run_state,block_Pt  block_P);
int intcntrl(int  run_state,block_Pt  block_P);
int intdmp(int  run_state,block_Pt  block_P);
int integrate(int  run_state,block_Pt  block_P);
int invcust(int  run_state,block_Pt  block_P);
int inventory(int  run_state,block_Pt  block_P);
int inverse(int  run_state,block_Pt  block_P);
int invert(int  run_state,block_Pt  block_P);
int itf(int  run_state,block_Pt  block_P);
int jitter(int  run_state,block_Pt  block_P);
int jkfade(int  run_state,block_Pt  block_P);
int jkff(int  run_state,block_Pt  block_P);
int limiter(int  run_state,block_Pt  block_P);
int linecode(int  run_state,block_Pt  block_P);
int lms(int  run_state,block_Pt  block_P);
int lpc(int  run_state,block_Pt  block_P);
int lpf(int  run_state,block_Pt  block_P);
int mau(int  run_state,block_Pt  block_P);
int mbset(int  run_state,block_Pt  block_P);
int mixer(int  run_state,block_Pt  block_P);
int more(int  run_state,block_Pt  block_P);
int mulaw(int  run_state,block_Pt  block_P);
int multiply(int  run_state,block_Pt  block_P);
int mux(int  run_state,block_Pt  block_P);
int nand(int  run_state,block_Pt  block_P);
int nl(int  run_state,block_Pt  block_P);
int node(int  run_state,block_Pt  block_P);
int nonlin(int  run_state,block_Pt  block_P);
int nor(int  run_state,block_Pt  block_P);
int null(int  run_state,block_Pt  block_P);
int offset(int  run_state,block_Pt  block_P);
int operate(int  run_state,block_Pt  block_P);
int or(int  run_state,block_Pt  block_P);
int phi_meter(int  run_state,block_Pt  block_P);
int pllfilt(int  run_state,block_Pt  block_P);
int plottxt(int  run_state,block_Pt  block_P);
int pngen(int  run_state,block_Pt  block_P);
int pngen2(int  run_state,block_Pt  block_P);
int powmeter(int  run_state,block_Pt  block_P);
int prbinimage(int  run_state,block_Pt  block_P);
int predftf(int  run_state,block_Pt  block_P);
int predlms(int  run_state,block_Pt  block_P);
int prfile(int  run_state,block_Pt  block_P);
int pri(int  run_state,block_Pt  block_P);
int primage(int  run_state,block_Pt  block_P);
int pulse(int  run_state,block_Pt  block_P);
int pump(int  run_state,block_Pt  block_P);
int qpsk(int  run_state,block_Pt  block_P);
int quot(int  run_state,block_Pt  block_P);
int radar(int  run_state,block_Pt  block_P);
int rangen(int  run_state,block_Pt  block_P);
int rdaiff(int  run_state,block_Pt  block_P);
int rdbinimg(int  run_state,block_Pt  block_P);
int rdfile(int  run_state,block_Pt  block_P);
int rdimage(int  run_state,block_Pt  block_P);
int rdmulti(int  run_state,block_Pt  block_P);
int repeater(int  run_state,block_Pt  block_P);
int replicate(int  run_state,block_Pt  block_P);
int resmpl(int  run_state,block_Pt  block_P);
int roundi(int  run_state,block_Pt  block_P);
int rxhdlc(int  run_state,block_Pt  block_P);
int sampler1(int  run_state,block_Pt  block_P);
int sar_azimuth_ref(int  run_state,block_Pt  block_P);
int sar_chirp(int  run_state,block_Pt  block_P);
int sar_range(int  run_state,block_Pt  block_P);
int sar_range_compress(int  run_state,block_Pt  block_P);
int scattertxt(int  run_state,block_Pt  block_P);
int scrambler(int  run_state,block_Pt  block_P);
int sdet(int  run_state,block_Pt  block_P);
int sdr(int  run_state,block_Pt  block_P);
int secord(int  run_state,block_Pt  block_P);
int seqgen(int  run_state,block_Pt  block_P);
int server(int  run_state,block_Pt  block_P);
int setsnr(int  run_state,block_Pt  block_P);
int sine(int  run_state,block_Pt  block_P);
int sink(int  run_state,block_Pt  block_P);
int skip(int  run_state,block_Pt  block_P);
int skipold(int  run_state,block_Pt  block_P);
int slice(int  run_state,block_Pt  block_P);
int slidefft(int  run_state,block_Pt  block_P);
int sn74ls93(int  run_state,block_Pt  block_P);
int spectrogramtxt(int  run_state,block_Pt  block_P);
int spectrumtxt(int  run_state,block_Pt  block_P);
int spiceprb(int  run_state,block_Pt  block_P);
int spread(int  run_state,block_Pt  block_P);
int sqr(int  run_state,block_Pt  block_P);
int sqrtnyq(int  run_state,block_Pt  block_P);
int srff(int  run_state,block_Pt  block_P);
int srlatch(int  run_state,block_Pt  block_P);
int stats(int  run_state,block_Pt  block_P);
int stc(int  run_state,block_Pt  block_P);
int stcode(int  run_state,block_Pt  block_P);
int str(int  run_state,block_Pt  block_P);
int strch(int  run_state,block_Pt  block_P);
int stretch(int  run_state,block_Pt  block_P);
int sum(int  run_state,block_Pt  block_P);
int symimp(int  run_state,block_Pt  block_P);
int target(int  run_state,block_Pt  block_P);
int tee(int  run_state,block_Pt  block_P);
int tff(int  run_state,block_Pt  block_P);
int threshold(int  run_state,block_Pt  block_P);
int toggle(int  run_state,block_Pt  block_P);
int transpose(int  run_state,block_Pt  block_P);
int trig(int  run_state,block_Pt  block_P);
int txhdlc(int  run_state,block_Pt  block_P);
int unitf(int  run_state,block_Pt  block_P);
int v29decoder(int  run_state,block_Pt  block_P);
int v29encoder(int  run_state,block_Pt  block_P);
int v2b(int  run_state,block_Pt  block_P);
int vcm(int  run_state,block_Pt  block_P);
int vecbit(int  run_state,block_Pt  block_P);
int wave(int  run_state,block_Pt  block_P);
int wraiff(int  run_state,block_Pt  block_P);
int xdco(int  run_state,block_Pt  block_P);
int xnor(int  run_state,block_Pt  block_P);
int xor(int  run_state,block_Pt  block_P);
int xygen(int  run_state,block_Pt  block_P);
int zc(int  run_state,block_Pt  block_P);
int zdummy(int  run_state,block_Pt  block_P);
int zero(int  run_state,block_Pt  block_P);
int zlpf(int  run_state,block_Pt  block_P);

/* model table Definition */
int model_count = 240;
modelEntry_t model[MAX_MODELS] = {

/* function, name, icon_id */
{ add,"add","add"},
{ addnoise,"addnoise","addnois"},
{ and,"and","and"},
{ ang,"ang","ang"},
{ arprocess,"arprocess","arproce"},
{ atod,"atod","atod"},
{ autoxcorr,"autoxcorr","autoxco"},
{ avrow,"avrow","avrow"},
{ bdata,"bdata","bdata"},
{ bitmanip,"bitmanip","bitmani"},
{ bitvec,"bitvec","bitvec"},
{ blindadapt,"blindadapt","blindad"},
{ bpf,"bpf","bpf"},
{ cable,"cable","cable"},
{ casfil,"casfil","casfil"},
{ clip,"clip","clip"},
{ clkdly,"clkdly","clkdly"},
{ cmplxfft,"cmplxfft","cmplxff"},
{ cmux,"cmux","cmux"},
{ cmxfft,"cmxfft","cmxfft"},
{ cmxfftfile,"cmxfftfile","cmxfftf"},
{ cmxifft,"cmxifft","cmxifft"},
{ convolve,"convolve","convolv"},
{ cstime,"cstime","cstime"},
{ cubepoly,"cubepoly","cubepol"},
{ cxadd,"cxadd","cxadd"},
{ cxaddnoise,"cxaddnoise","cxaddno"},
{ cxconj,"cxconj","cxconj"},
{ cxcorr,"cxcorr","cxcorr"},
{ cxdelay,"cxdelay","cxdelay"},
{ cxgain,"cxgain","cxgain"},
{ cxmag,"cxmag","cxmag"},
{ cxmakecx,"cxmakecx","cxmakec"},
{ cxmakereal,"cxmakereal","cxmaker"},
{ cxmult,"cxmult","cxmult"},
{ cxnode,"cxnode","cxnode"},
{ cxphase,"cxphase","cxphase"},
{ cxrdfile,"cxrdfile","cxrdfil"},
{ cxreal,"cxreal","cxreal"},
{ cxreim,"cxreim","cxreim"},
{ cxsetsnr,"cxsetsnr","cxsetsn"},
{ cxsink,"cxsink","cxsink"},
{ cxskip,"cxskip","cxskip"},
{ cxsum,"cxsum","cxsum"},
{ datagen,"datagen","datagen"},
{ dco,"dco","dco"},
{ dco2,"dco2","dco2"},
{ dec_qpsk,"dec_qpsk","dec_qps"},
{ decbin,"decbin","decbin"},
{ decimate,"decimate","decimat"},
{ delay,"delay","delay"},
{ demux,"demux","demux"},
{ dff,"dff","dff"},
{ dffil,"dffil","dffil"},
{ divby2,"divby2","divby2"},
{ divider,"divider","divider"},
{ divider2,"divider2","divider"},
{ ds2,"ds2","ds2"},
{ ds3,"ds3","ds3"},
{ dtoa,"dtoa","dtoa"},
{ ecount,"ecount","ecount"},
{ ecountfap,"ecountfap","ecountf"},
{ encoder,"encoder","encoder"},
{ ethline,"ethline","ethline"},
{ expr,"expr","expr"},
{ fade,"fade","fade"},
{ fconv,"fconv","fconv"},
{ filtnyq,"filtnyq","filtnyq"},
{ fir,"fir","fir"},
{ firfil,"firfil","firfil"},
{ fm,"fm","fm"},
{ freq_meter,"freq_meter","freq_me"},
{ freqimp,"freqimp","freqimp"},
{ fti,"fti","fti"},
{ fxadd,"fxadd","fxadd"},
{ fxdelay,"fxdelay","fxdelay"},
{ fxgain,"fxgain","fxgain"},
{ fxnl,"fxnl","fxnl"},
{ fxnode,"fxnode","fxnode"},
{ gain,"gain","gain"},
{ gauss,"gauss","gauss"},
{ hilbert,"hilbert","hilbert"},
{ histtxt,"histtxt","histtxt"},
{ hold,"hold","hold"},
{ iirfil,"iirfil","iirfil"},
{ img_sar_azimuth_compress,"img_sar_azimuth_compress","img_sar"},
{ img_sar_create,"img_sar_create","img_sar"},
{ img_sar_range_compress,"img_sar_range_compress","img_sar"},
{ imgaddnoise,"imgaddnoise","imgaddn"},
{ imgbreakup,"imgbreakup","imgbrea"},
{ imgbuild,"imgbuild","imgbuil"},
{ imgcalc,"imgcalc","imgcalc"},
{ imgcxmag,"imgcxmag","imgcxma"},
{ imgcxtrl,"imgcxtrl","imgcxtr"},
{ imgfft,"imgfft","imgfft"},
{ imgfilter,"imgfilter","imgfilt"},
{ imggen,"imggen","imggen"},
{ imghisteq,"imghisteq","imghist"},
{ imginterp,"imginterp","imginte"},
{ imgmanip,"imgmanip","imgmani"},
{ imgmux,"imgmux","imgmux"},
{ imgnode,"imgnode","imgnode"},
{ imgnonlinfil,"imgnonlinfil","imgnonl"},
{ imgnormalize,"imgnormalize","imgnorm"},
{ imgprasc,"imgprasc","imgpras"},
{ imgprbin,"imgprbin","imgprbi"},
{ imgproc,"imgproc","imgproc"},
{ imgrdasc,"imgrdasc","imgrdas"},
{ imgrdbin,"imgrdbin","imgrdbi"},
{ imgrdfptiff,"imgrdfptiff","imgrdfp"},
{ imgrdtiff,"imgrdtiff","imgrdti"},
{ imgrtcx,"imgrtcx","imgrtcx"},
{ imgserin,"imgserin","imgseri"},
{ imgserout,"imgserout","imgsero"},
{ imgshrink,"imgshrink","imgshri"},
{ imgsink,"imgsink","imgsink"},
{ imgsubimg,"imgsubimg","imgsubi"},
{ imgwrfptiff,"imgwrfptiff","imgwrfp"},
{ imgwrtiff,"imgwrtiff","imgwrti"},
{ impulse,"impulse","impulse"},
{ intcntrl,"intcntrl","intcntr"},
{ intdmp,"intdmp","intdmp"},
{ integrate,"integrate","integra"},
{ invcust,"invcust","invcust"},
{ inventory,"inventory","invento"},
{ inverse,"inverse","inverse"},
{ invert,"invert","invert"},
{ itf,"itf","itf"},
{ jitter,"jitter","jitter"},
{ jkfade,"jkfade","jkfade"},
{ jkff,"jkff","jkff"},
{ limiter,"limiter","limiter"},
{ linecode,"linecode","linecod"},
{ lms,"lms","lms"},
{ lpc,"lpc","lpc"},
{ lpf,"lpf","lpf"},
{ mau,"mau","mau"},
{ mbset,"mbset","mbset"},
{ mixer,"mixer","mixer"},
{ more,"more","more"},
{ mulaw,"mulaw","mulaw"},
{ multiply,"multiply","multipl"},
{ mux,"mux","mux"},
{ nand,"nand","nand"},
{ nl,"nl","nl"},
{ node,"node","node"},
{ nonlin,"nonlin","nonlin"},
{ nor,"nor","nor"},
{ null,"null","null"},
{ offset,"offset","offset"},
{ operate,"operate","operate"},
{ or,"or","or"},
{ phi_meter,"phi_meter","phi_met"},
{ pllfilt,"pllfilt","pllfilt"},
{ plottxt,"plottxt","plottxt"},
{ pngen,"pngen","pngen"},
{ pngen2,"pngen2","pngen2"},
{ powmeter,"powmeter","powmete"},
{ prbinimage,"prbinimage","prbinim"},
{ predftf,"predftf","predftf"},
{ predlms,"predlms","predlms"},
{ prfile,"prfile","prfile"},
{ pri,"pri","pri"},
{ primage,"primage","primage"},
{ pulse,"pulse","pulse"},
{ pump,"pump","pump"},
{ qpsk,"qpsk","qpsk"},
{ quot,"quot","quot"},
{ radar,"radar","radar"},
{ rangen,"rangen","rangen"},
{ rdaiff,"rdaiff","rdaiff"},
{ rdbinimg,"rdbinimg","rdbinim"},
{ rdfile,"rdfile","rdfile"},
{ rdimage,"rdimage","rdimage"},
{ rdmulti,"rdmulti","rdmulti"},
{ repeater,"repeater","repeate"},
{ replicate,"replicate","replica"},
{ resmpl,"resmpl","resmpl"},
{ roundi,"roundi","roundi"},
{ rxhdlc,"rxhdlc","rxhdlc"},
{ sampler1,"sampler1","sampler"},
{ sar_azimuth_ref,"sar_azimuth_ref","sar_azi"},
{ sar_chirp,"sar_chirp","sar_chi"},
{ sar_range,"sar_range","sar_ran"},
{ sar_range_compress,"sar_range_compress","sar_ran"},
{ scattertxt,"scattertxt","scatter"},
{ scrambler,"scrambler","scrambl"},
{ sdet,"sdet","sdet"},
{ sdr,"sdr","sdr"},
{ secord,"secord","secord"},
{ seqgen,"seqgen","seqgen"},
{ server,"server","server"},
{ setsnr,"setsnr","setsnr"},
{ sine,"sine","sine"},
{ sink,"sink","sink"},
{ skip,"skip","skip"},
{ skipold,"skipold","skipold"},
{ slice,"slice","slice"},
{ slidefft,"slidefft","slideff"},
{ sn74ls93,"sn74ls93","sn74ls9"},
{ spectrogramtxt,"spectrogramtxt","spectro"},
{ spectrumtxt,"spectrumtxt","spectru"},
{ spiceprb,"spiceprb","spicepr"},
{ spread,"spread","spread"},
{ sqr,"sqr","sqr"},
{ sqrtnyq,"sqrtnyq","sqrtnyq"},
{ srff,"srff","srff"},
{ srlatch,"srlatch","srlatch"},
{ stats,"stats","stats"},
{ stc,"stc","stc"},
{ stcode,"stcode","stcode"},
{ str,"str","str"},
{ strch,"strch","strch"},
{ stretch,"stretch","stretch"},
{ sum,"sum","sum"},
{ symimp,"symimp","symimp"},
{ target,"target","target"},
{ tee,"tee","tee"},
{ tff,"tff","tff"},
{ threshold,"threshold","thresho"},
{ toggle,"toggle","toggle"},
{ transpose,"transpose","transpo"},
{ trig,"trig","trig"},
{ txhdlc,"txhdlc","txhdlc"},
{ unitf,"unitf","unitf"},
{ v29decoder,"v29decoder","v29deco"},
{ v29encoder,"v29encoder","v29enco"},
{ v2b,"v2b","v2b"},
{ vcm,"vcm","vcm"},
{ vecbit,"vecbit","vecbit"},
{ wave,"wave","wave"},
{ wraiff,"wraiff","wraiff"},
{ xdco,"xdco","xdco"},
{ xnor,"xnor","xnor"},
{ xor,"xor","xor"},
{ xygen,"xygen","xygen"},
{ zc,"zc","zc"},
{ zdummy,"zdummy","zdummy"},
{ zero,"zero","zero"},
{ zlpf,"zlpf","zlpf"}
};
