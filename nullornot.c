#include <stdio.h>
#include <limits.h>
#include <sys/time.h>

#if defined FUNCTION
#if defined FUNCTION_ELSE && defined FUNCTION_INLINE
#define STRAT "Inlined if-then-else function call"
#elif defined FUNCTION_ELSE
#define STRAT "If-then-else function call"
#elif defined FUNCTION_INLINE
#define STRAT "Inlined if-then-return function call"
#else
#define STRAT "If-then-return function call"
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
#if defined FUNCTION_INLINE
static inline
#endif
const char *
str_is_null(const char *str, const char *def_str)
{
	if (str)
		return str;
#if defined FUNCTION_ELSE
	else
#endif
	return def_str;
}
#elif defined DEFINE
#define str_is_null(s, d) (s != NULL ? s : #d)
#endif

#define RUNS 10

int
main(int argc, char **argv)
{
	struct timeval stop, start;
	float exec[RUNS];
	float avg = 0.0, high = 0.0, low = 0.0;

	for (int run = 0; run < RUNS; run ++)
	{
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
		exec[run] = ((stop.tv_sec - start.tv_sec) * 1000.0f + (stop.tv_usec - start.tv_usec) / 1000.0f);
	}

	for (int i = 0; i < RUNS; i++)
	{
		if (i == 0 || exec[i] < low)
			low = exec[i];
		if (i == 0 || exec[i] > high)
			high = exec[i];
		avg += exec[i];
	}
	avg = avg/RUNS;

	fprintf(stderr, "%s execution: %f ms (%f, %f)\n", STRAT, avg, low, high);
	
	return 0;
}
