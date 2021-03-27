# 1 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.35/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdio.h" 1



# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\musl_xc8.h" 1
# 4 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdio.h" 2






# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\features.h" 1
# 10 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdio.h" 2
# 24 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdio.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1





typedef void * va_list[1];




typedef void * __isoc_va_list[1];
# 122 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef unsigned size_t;
# 137 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef long ssize_t;
# 168 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef __int24 int24_t;
# 204 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef __uint24 uint24_t;
# 246 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef long long off_t;
# 399 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef struct _IO_FILE FILE;
# 24 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdio.h" 2
# 52 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdio.h"
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern FILE *const stdin;
extern FILE *const stdout;
extern FILE *const stderr;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);
int ungetc(int, FILE *);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);

char *fgets(char *restrict, int, FILE *restrict);

char *gets(char *);


int fputs(const char *restrict, FILE *restrict);
int puts(const char *);

#pragma printf_check(printf) const
#pragma printf_check(vprintf) const
#pragma printf_check(sprintf) const
#pragma printf_check(snprintf) const
#pragma printf_check(vsprintf) const
#pragma printf_check(vsnprintf) const

int printf(const char *restrict, ...);
int fprintf(FILE *restrict, const char *restrict, ...);
int sprintf(char *restrict, const char *restrict, ...);
int snprintf(char *restrict, size_t, const char *restrict, ...);

int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

int scanf(const char *restrict, ...);
int fscanf(FILE *restrict, const char *restrict, ...);
int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *open_memstream(char **, size_t *);
FILE *fdopen(int, const char *);
FILE *popen(const char *, const char *);
int pclose(FILE *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int dprintf(int, const char *restrict, ...);
int vdprintf(int, const char *restrict, __isoc_va_list);
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
ssize_t getdelim(char **restrict, size_t *restrict, int, FILE *restrict);
ssize_t getline(char **restrict, size_t *restrict, FILE *restrict);
int renameat(int, const char *, int, const char *);
char *ctermid(char *);







char *tempnam(const char *, const char *);
# 1 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\ctype.h" 1
# 10 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\ctype.h"
int isalnum(int);
int isalpha(int);
int isblank(int);
int iscntrl(int);
int isdigit(int);
int isgraph(int);
int islower(int);
int isprint(int);
int ispunct(int);
int isspace(int);
int isupper(int);
int isxdigit(int);
int tolower(int);
int toupper(int);
# 41 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\ctype.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1
# 411 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef struct __locale_struct * locale_t;
# 41 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\ctype.h" 2


int isalnum_l(int, locale_t);
int isalpha_l(int, locale_t);
int isblank_l(int, locale_t);
int iscntrl_l(int, locale_t);
int isdigit_l(int, locale_t);
int isgraph_l(int, locale_t);
int islower_l(int, locale_t);
int isprint_l(int, locale_t);
int ispunct_l(int, locale_t);
int isspace_l(int, locale_t);
int isupper_l(int, locale_t);
int isxdigit_l(int, locale_t);
int tolower_l(int, locale_t);
int toupper_l(int, locale_t);

int isascii(int);
int toascii(int);
# 2 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdlib.h" 1
# 21 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdlib.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1
# 18 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef long int wchar_t;
# 21 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdlib.h" 2


int atoi (const char *);
long atol (const char *);
long long atoll (const char *);
double atof (const char *);

float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);



long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);
long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);

int rand (void);
void srand (unsigned);

          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));

__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);
long long llabs (long long);

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
typedef struct { long long quot, rem; } lldiv_t;

div_t div (int, int);
ldiv_t ldiv (long, long);
lldiv_t lldiv (long long, long long);

typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);





size_t __ctype_get_mb_cur_max(void);
# 3 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\string.h" 1
# 25 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\string.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1
# 25 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\string.h" 2


void *memcpy (void *restrict, const void *restrict, size_t);
void *memmove (void *, const void *, size_t);
void *memset (void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void *memchr (const void *, int, size_t);

char *strcpy (char *restrict, const char *restrict);
char *strncpy (char *restrict, const char *restrict, size_t);

char *strcat (char *restrict, const char *restrict);
char *strncat (char *restrict, const char *restrict, size_t);

int strcmp (const char *, const char *);
int strncmp (const char *, const char *, size_t);

int strcoll (const char *, const char *);
size_t strxfrm (char *restrict, const char *restrict, size_t);

char *strchr (const char *, int);
char *strrchr (const char *, int);

size_t strcspn (const char *, const char *);
size_t strspn (const char *, const char *);
char *strpbrk (const char *, const char *);
char *strstr (const char *, const char *);
char *strtok (char *restrict, const char *restrict);

size_t strlen (const char *);

char *strerror (int);
# 65 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\string.h"
char *strtok_r (char *restrict, const char *restrict, char **restrict);
int strerror_r (int, char *, size_t);
char *stpcpy(char *restrict, const char *restrict);
char *stpncpy(char *restrict, const char *restrict, size_t);
size_t strnlen (const char *, size_t);
char *strdup (const char *);
char *strndup (const char *, size_t);
char *strsignal(int);
char *strerror_l (int, locale_t);
int strcoll_l (const char *, const char *, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);




void *memccpy (void *restrict, const void *restrict, int, size_t);
# 4 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdarg.h" 1







# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1
# 8 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdarg.h" 2


#pragma intrinsic(__va_start)
#pragma intrinsic(__va_arg)

extern void * __va_start(void);
extern void * __va_arg(void *, ...);
# 5 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\conio.h" 1







# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\errno.h" 1
# 10 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\errno.h"
extern int errno;
# 8 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\conio.h" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.35/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\__null.h" 1 3
# 9 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\conio.h" 2



extern void init_uart(void);

extern char getch(void);
extern char getche(void);
extern void putch(char);
extern void ungetch(char);

extern __bit kbhit(void);



extern char * cgets(char *);
extern void cputs(const char *);
# 6 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h" 1
# 10 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdint.h" 1
# 22 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdint.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1
# 127 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef unsigned long uintptr_t;
# 142 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef long intptr_t;
# 158 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef signed char int8_t;




typedef short int16_t;
# 173 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef long int32_t;
# 186 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef int32_t intmax_t;







typedef unsigned char uint8_t;




typedef unsigned short uint16_t;
# 209 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef unsigned long uint32_t;
# 227 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef uint32_t uintmax_t;
# 22 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdint.h" 2


typedef int8_t int_fast8_t;




typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;

typedef int32_t int_least32_t;




typedef uint8_t uint_fast8_t;




typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;

typedef uint32_t uint_least32_t;
# 139 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdint.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/stdint.h" 1
typedef int32_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint32_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 139 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\stdint.h" 2
# 10 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h" 2





# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h" 1
# 33 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/alltypes.h"
typedef float float_t;




typedef double double_t;
# 15 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h" 2
# 42 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h"
int __fpclassifyf(float);







int __signbitf(float);
# 59 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h"
double acos(double);
float acosf(float);
long double acosl(long double);



double acosh(double);
float acoshf(float);
long double acoshl(long double);



double asin(double);
float asinf(float);
long double asinl(long double);



double asinh(double);
float asinhf(float);
long double asinhl(long double);



double atan(double);
float atanf(float);
long double atanl(long double);



double atan2(double, double);
float atan2f(float, float);
long double atan2l(long double, long double);



double atanh(double);
float atanhf(float);
long double atanhl(long double);



double cbrt(double);
float cbrtf(float);
long double cbrtl(long double);



double ceil(double);
float ceilf(float);
long double ceill(long double);



double copysign(double, double);
float copysignf(float, float);
long double copysignl(long double, long double);



double cos(double);
float cosf(float);
long double cosl(long double);



double cosh(double);
float coshf(float);
long double coshl(long double);



double erf(double);
float erff(float);
long double erfl(long double);



double erfc(double);
float erfcf(float);
long double erfcl(long double);



double exp(double);
float expf(float);
long double expl(long double);



double exp2(double);
float exp2f(float);
long double exp2l(long double);



double expm1(double);
float expm1f(float);
long double expm1l(long double);



double fabs(double);
float fabsf(float);
long double fabsl(long double);



double fdim(double, double);
float fdimf(float, float);
long double fdiml(long double, long double);



double floor(double);
float floorf(float);
long double floorl(long double);



double fma(double, double, double);
float fmaf(float, float, float);
long double fmal(long double, long double, long double);



double fmax(double, double);
float fmaxf(float, float);
long double fmaxl(long double, long double);



double fmin(double, double);
float fminf(float, float);
long double fminl(long double, long double);



double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);



double frexp(double, int *);
float frexpf(float, int *);
long double frexpl(long double, int *);



double hypot(double, double);
float hypotf(float, float);
long double hypotl(long double, long double);



int ilogb(double);
int ilogbf(float);
int ilogbl(long double);



double ldexp(double, int);
float ldexpf(float, int);
long double ldexpl(long double, int);



double lgamma(double);
float lgammaf(float);
long double lgammal(long double);



long long llrint(double);
long long llrintf(float);
long long llrintl(long double);



long long llround(double);
long long llroundf(float);
long long llroundl(long double);



double log(double);
float logf(float);
long double logl(long double);



double log10(double);
float log10f(float);
long double log10l(long double);



double log1p(double);
float log1pf(float);
long double log1pl(long double);



double log2(double);
float log2f(float);
long double log2l(long double);



double logb(double);
float logbf(float);
long double logbl(long double);



long lrint(double);
long lrintf(float);
long lrintl(long double);



long lround(double);
long lroundf(float);
long lroundl(long double);



double modf(double, double *);
float modff(float, float *);
long double modfl(long double, long double *);



double nan(const char *);
float nanf(const char *);
long double nanl(const char *);



double nearbyint(double);
float nearbyintf(float);
long double nearbyintl(long double);



double nextafter(double, double);
float nextafterf(float, float);
long double nextafterl(long double, long double);



double nexttoward(double, long double);
float nexttowardf(float, long double);
long double nexttowardl(long double, long double);




double pow(double, double);
__attribute__((nonreentrant)) float powf(float, float);
long double powl(long double, long double);



double remainder(double, double);
float remainderf(float, float);
long double remainderl(long double, long double);



double remquo(double, double, int *);
float remquof(float, float, int *);
long double remquol(long double, long double, int *);



double rint(double);
float rintf(float);
long double rintl(long double);



double round(double);
float roundf(float);
long double roundl(long double);



double scalbln(double, long);
float scalblnf(float, long);
long double scalblnl(long double, long);



double scalbn(double, int);
float scalbnf(float, int);
long double scalbnl(long double, int);



double sin(double);
float sinf(float);
long double sinl(long double);



double sinh(double);
float sinhf(float);
long double sinhl(long double);



double sqrt(double);
float sqrtf(float);
long double sqrtl(long double);



double tan(double);
float tanf(float);
long double tanl(long double);



double tanh(double);
float tanhf(float);
long double tanhl(long double);



double tgamma(double);
float tgammaf(float);
long double tgammal(long double);



double trunc(double);
float truncf(float);
long double truncl(long double);
# 423 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\math.h"
extern int signgam;

double j0(double);
double j1(double);
double jn(int, double);

double y0(double);
double y1(double);
double yn(int, double);
# 7 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2

# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\float.h" 1







int __flt_rounds(void);
# 46 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\float.h"
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\bits/float.h" 1
# 46 "C:/Program Files (x86)/Microchip/MPLABX/v2.20/pic/include/c99\\float.h" 2
# 8 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c" 2




#pragma warning disable 350
# 358 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
const static unsigned int dpowers[] = {1, 10, 100, 1000, 10000,




        };
# 463 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
int
# 505 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
sprintf(char * sp, const char * f, ...)
{
 va_list ap;




 char c;
# 521 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
 signed char prec;



 unsigned char flag;
# 540 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
 union {
  unsigned long vd;
  double integ;
 } tmpval;

 unsigned int val;
 unsigned len;
 const char * cp;


 *ap = __va_start();


 while((c = *f++)) {

  if(c != '%')

  {
   ((*sp++ = (c)));
   continue;
  }




  flag = 0;
# 661 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  switch(c = *f++) {

  case 0:
   goto alldone;
# 723 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  case 'd':
  case 'i':
   break;
# 754 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  case 's':





    cp = (*(const char * *)__va_arg(*(const char * **)ap, (const char *)0));





   if(!cp)
    cp = "(null)";
# 803 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
   while(*cp)
    ((*sp++ = (*cp++)));
   continue;
# 828 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  default:
# 839 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
   continue;
# 848 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  }
# 1279 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  {





    val = (unsigned int)(*(int *)__va_arg(*(int **)ap, (int)0));

   if((int)val < 0) {
    flag |= 0x03;
    val = -val;
   }

  }
# 1331 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
   for(c = 1 ; c != sizeof dpowers/sizeof dpowers[0] ; c++)
    if(val < dpowers[c])
     break;
# 1448 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  {
# 1464 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
   if(flag & 0x03)
    ((*sp++ = ('-')));
# 1495 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
  }


  prec = c;

  while(prec--) {



   {
# 1515 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
    c = (val / dpowers[(unsigned char)prec]) % 10 + '0';
# 1549 "C:\\Program Files (x86)\\Microchip\\MPLABX\\v2.20\\pic\\sources\\c90\\common\\doprnt.c"
   }
   ((*sp++ = (c)));
  }







 }

alldone:


 *sp = 0;

 return 0;
}
