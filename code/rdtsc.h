static __inline__ unsigned long GetCC(void)
{
  unsigned a, d;
  __asm__ __volatile__("rdtsc" : "=a" (a), "=d" (d));
  return ((unsigned long)a) | (((unsigned long)d) << 32);
}
