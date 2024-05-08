#include <limits.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

static bool print(const char *data, size_t length) {
  const unsigned char *bytes = (const unsigned char *)data;
  for (size_t i = 0; i < length; i++)
    if (putchar(bytes[i]) == EOF)
      return false;
  return true;
}

// 32-bit kernel
// map everything to 32-bits
static size_t fill_buffer(uint32_t data, char *buffer, int base) {
  size_t i = 0;
  while (data) {
    int rem = data % base;
    buffer[i++] = rem < 10 ? rem + '0' : rem + 'a' - 10;
    data = data / base;
  }
  size_t l = 0;
  size_t r = i - 1;
  while (l < r) {
    char temp = buffer[l];
    buffer[l] = buffer[r];
    buffer[r] = temp;
    l++;
    r--;
  }

  return i;
}

int printf(const char *restrict format, ...) {
  va_list parameters;
  va_start(parameters, format);

  int written = 0;

  while (*format != '\0') {
    size_t maxrem = INT_MAX - written;

    if (format[0] != '%' || format[1] == '%') {
      if (format[0] == '%')
        format++;
      size_t amount = 1;
      while (format[amount] && format[amount] != '%')
        amount++;
      if (maxrem < amount) {
        // TODO: Set errno to EOVERFLOW.
        return -1;
      }
      if (!print(format, amount))
        return -1;
      format += amount;
      written += amount;
      continue;
    }

    const char *format_begun_at = format++;

    if (*format == 'c') {
      format++;
      char c = (char)va_arg(parameters, int /* char promotes to int */);
      if (!maxrem) {
        // TODO: Set errno to EOVERFLOW.
        return -1;
      }
      if (!print(&c, sizeof(c)))
        return -1;
      written++;
    } else if (*format == 's') {
      format++;
      const char *str = va_arg(parameters, const char *);
      size_t len = strlen(str);
      if (maxrem < len) {
        // TODO: Set errno to EOVERFLOW.
        return -1;
      }
      if (!print(str, len))
        return -1;
      written += len;
    } else if (*format == 'u') {
      format++;
      const uint32_t digit = va_arg(parameters, const uint32_t);
      char buffer[10];
      size_t len = fill_buffer(digit, buffer, 10);
      // TODO
      if (maxrem < len) {
        // TODO: Set errno to EOVERFLOW.
        return -1;
      }
      if (!print(buffer, len)) {
        return -1;
      }
      written += len;
    } else if (*format == 'x') {
      format++;
      const uint32_t digit = va_arg(parameters, const uint32_t);
      char buffer[10];
      size_t len = fill_buffer(digit, buffer, 16);
      // TODO
      if (!print("0x", 2)) {
        return -1;
      }
      written += 2;
      if (maxrem < len) {
        // TODO: Set errno to EOVERFLOW.
        return -1;
      }
      if (!print(buffer, len)) {
        return -1;
      }
      written += len;
    } else {
      format = format_begun_at;
      size_t len = strlen(format);
      if (maxrem < len) {
        // TODO: Set errno to EOVERFLOW.
        return -1;
      }
      if (!print(format, len))
        return -1;
      written += len;
      format += len;
    }
  }

  va_end(parameters);
  return written;
}
