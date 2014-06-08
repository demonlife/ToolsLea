#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/syscall.h>

static void *thread_func(void *args);

pthread_mutex_t g_mutex = PTHREAD_MUTEX_INITIALIZER;

int sum = 0;
#define MAX_NUM 10000

int main(int argc, char *argv[]) {
  int seq = 0;
  pthread_t thread_handle;

  for (seq = 0; seq < 5; seq ++) {
    int *tmp_seq = (int*)malloc(sizeof(int));

    *tmp_seq = seq;
    pthread_create(&thread_handle, NULL, thread_func, tmp_seq);
  }

  while (1) sleep(20);
  return 0;
}

static void *thread_func(void *args) {
  int thread_seq = *(int*)args;

  free(args);

  pid_t tid = (pid_t) syscall(SYS_gettid);
  while (1) {
    sleep(thread_seq + 2);
    pthread_mutex_lock(&g_mutex);
    if (sum < MAX_NUM)
      sum ++;
    else
      sum = 0;
    printf("in thread %d, sum is %d\n", thread_seq, sum);
    pthread_mutex_unlock(&g_mutex);
  }
}
