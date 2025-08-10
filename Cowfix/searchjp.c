struct _jp_to {
  int	From;	//index in Labels
  int	To;	//index in Labels
} jpto;

// returns last To in the chain jp -> jp ... -> jp
int SearchJp(int target, struct _jp_to *jpto, int counter)
{
  int n;

  for (n = 0; n < counter; n++)
  {
    if (jpto[n].From == target)
      return SearchJp(jpto[n].To, jpto, counter);
  }
  
  return target;
}


