#include <stdio.h>
#include <limits.h>
#include <sys/time.h>

#if defined FUNCTION
#if defined INLINE
#define STRAT "Inlined function call"
#else
#define STRAT "Function call"
#endif
#elif defined DEFINE
#define STRAT "Preprocessor defined ternary"
#elif defined ELVIS
#define STRAT "Elvis ternary"
#elif defined IFTHENELSE
#define STRAT "If Then Else chain"
#endif

const char * str_array[] = {
	NULL,
	"The",
	"quick",
	"brown",
	NULL,
	"fox",
	"jumps over",
	NULL,
	"the",
	"lazy",
	"dog",
	NULL
};

#if defined FUNCTION
#if defined INLINE
static inline
#endif
const char *
str_is_null(const char *str, const char *def_str)
{
	if (str)
		return str;
	
	return def_str;
}
#elif defined DEFINE
#define str_is_null(s, d) (s != NULL ? s : #d)
#endif

int
main(int argc, char **argv)
{
	struct timeval stop, start;
	gettimeofday(&start, NULL);

	for (int i = 0; i < INT_MAX; i++)
	{
		for (int j = 0; i < 12; i++)
		{
#if defined ELVIS
			printf("%s", (str_array[j] ?: "XXX - found null\n"));
#elif defined IFTHENELSE
			if (str_array[j])
				printf("%s", str_array[j]);
			else
				printf("XXX - found null\n");
#else
			printf("%s", str_is_null(str_array[j], "XXX - found null\n"));
#endif
		}
	}

	gettimeofday(&stop, NULL);
	fprintf(stderr, "%s execution: %f ms\n",
		STRAT,
		((stop.tv_sec - start.tv_sec) * 1000.0f + (stop.tv_usec - start.tv_usec) / 1000.0f));
	
	return 0;
}
